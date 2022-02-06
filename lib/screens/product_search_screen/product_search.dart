import 'package:fluthut/components/products_grid.dart';
import 'package:fluthut/constants.dart';
import 'package:fluthut/controller/product_controller.dart';
import 'package:fluthut/models/all_products_model/all_products_model.dart';
import 'package:fluthut/size_config.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluthut/size_config.dart';
import 'package:get/get.dart';
import '../../components/search_bar.dart';
import '../single_product.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ProductsController _controller = Get.put(ProductsController());

  //this will add filtered items after search in this List.
  List<ProductsModel> displayList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // temporaryly added. later can be removed

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
            ),
            onPressed: () {},
          ),
          // title: SearchBar(),
          title: Container(

            height: percentHeight(5),
            child: TextField(
              controller: _searchController,
              onChanged: (query){
                setState(() {
                  displayList = _controller.productList.where((result){
                    var name = result.name.toLowerCase();
                    return name.contains(query);
                  }).toList();
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: kPrimaryLightColor,
                filled: true,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_alt_outlined, color: kSecondaryColor),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
//background color of box
                  BoxShadow(
                    color: kPrimaryShadowColor,
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 10.0, //extend the shadow
                    offset: Offset(
                      0, // Move to right 10  horizontally
                      10.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.transparent,
                labelColor: kPrimaryColor,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                unselectedLabelColor: kSecondaryColor,
                tabs: [
                  Tab(
                    child: Text(
                      "Best Match",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Top Rated",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Price Low-High",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6),
                  itemCount:_searchController.text.length == 0 ? _controller.productList.length : displayList.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return _searchController.text.length == 0 ? Visibility(
                      // visible: _controller.productList[index].featured ,
                      replacement: SizedBox(),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shadowColor: kPrimaryShadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        elevation: 8,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      SingleProduct(_controller.productList[index]))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Hero(
                                    tag: _controller.productList[index],
                                    child: Image.network(
                                      '${_controller.productList[index].images[0].src}',
                                      fit: BoxFit.cover,
                                      height: percentWidth(38),
                                      width: percentWidth(50),
                                    ),
                                  ),
                                  Positioned(
                                      right: 3,
                                      top: 3,
                                      height: 42,
                                      width: 42,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            color: kSecondaryColor,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 6.0, bottom: 7),
                                      child: Text(
                                        '${_controller.productList[index].name}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(top: 240,left: 5),
                                          child: Text(
                                            '\$${_controller.productList[index].price}',
                                            style: TextStyle(
                                                color: kSecondaryColor, fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(top: 240,left: 140),
                                          // height: 30,width: 50,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: _controller.productList[index]
                                                  .ratingCount ==
                                                  0
                                                  ? kSecondaryColor
                                                  : kPrimaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              Text(
                                                '${_controller.productList[index].ratingCount == 0 ? 0.0 : _controller.productList[index].ratingCount}',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ) : Visibility(
                      // visible: _controller.productList[index].featured ,
                      replacement: SizedBox(),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shadowColor: kPrimaryShadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        elevation: 8,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      SingleProduct(displayList[index]))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  Hero(
                                    tag: displayList[index],
                                    child: Image.network(
                                      '${displayList[index].images[0].src}',
                                      fit: BoxFit.cover,
                                      height: percentWidth(38),
                                      width: percentWidth(50),
                                    ),
                                  ),
                                  Positioned(
                                      right: 3,
                                      top: 3,
                                      height: 42,
                                      width: 42,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(50.0),
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_shopping_cart,
                                            color: kSecondaryColor,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 6.0, bottom: 7),
                                      child: Text(
                                        '${displayList[index].name}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          // margin: EdgeInsets.only(top: 240,left: 5),
                                          child: Text(
                                            '\$${displayList[index].price}',
                                            style: TextStyle(
                                                color: kSecondaryColor, fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          // margin: EdgeInsets.only(top: 240,left: 140),
                                          // height: 30,width: 50,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: displayList[index]
                                                  .ratingCount ==
                                                  0
                                                  ? kSecondaryColor
                                                  : kPrimaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.white,
                                                size: 18,
                                              ),
                                              Text(
                                                '${displayList[index].ratingCount == 0 ? 0.0 : displayList[index].ratingCount}',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
