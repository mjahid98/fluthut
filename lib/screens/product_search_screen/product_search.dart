import 'package:fluthut/components/products_grid.dart';
import 'package:fluthut/constants.dart';
import 'package:fluthut/size_config.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluthut/size_config.dart';
import '../../components/search_bar.dart';

class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({Key? key}) : super(key: key);

  @override
  _ProductSearchScreenState createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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
          title: SearchBar(),
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
              child: ProductsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
