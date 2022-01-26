import 'package:fluthut/controller/product_controller.dart';
import 'package:fluthut/screens/single_product.dart';
import 'package:fluthut/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  final ProductsController _controller = Get.put(ProductsController());

  @override
  void initState() {
    _controller.fetchProductsData(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isLoadingProducts.value) {
        return Container(
            height: percentHeight(60),
            child: Center(child: CircularProgressIndicator()));
      } else {
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6),
            itemCount: _controller.productList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Visibility(
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
                            Image.network(
                              '${_controller.productList[index].images[0].src}',
                              fit: BoxFit.cover,
                              height: percentWidth(38),
                              width: percentWidth(50),
                            ),
                            Positioned(
                                right: 3,
                                top: 3,height: 42,
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
              );
            });
      }
    });
  }
}
