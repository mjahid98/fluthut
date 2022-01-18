import 'package:fluthut/size_config.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProductsGrid extends StatefulWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all( 10 ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6),
        itemCount: 30,
        itemBuilder: (BuildContext ctx, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shadowColor: kPrimaryShadowColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(15.0))),
            elevation: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/product-image-1.jpg',
                    fit: BoxFit.cover,
                    height: percentWidth(38),
                    width: percentWidth(50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 6.0, bottom: 7),
                        child: Row(
                          children: [
                            Text(
                              'Product Name',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(top: 240,left: 5),
                            child: Text(
                              '\$24.99',
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 15),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 240,left: 140),
                            // height: 30,width: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
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
                                  '4.9',
                                  style: TextStyle(
                                      color: Colors.white),
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
          );
        });
  }
}
