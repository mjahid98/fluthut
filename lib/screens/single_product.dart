import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/product-image-1.jpg',
                  fit: BoxFit.contain,
                  height: percentWidth(115),
                  width: percentWidth(100),
                ),
                Container(
                  height: percentWidth(25),
                  child: ListView.builder(
                      padding: EdgeInsets.only(
                        bottom: percentWidth(3),
                        top: percentWidth(3),
                        right: percentWidth(10),
                        left: percentWidth(10),
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(children: [
                          Container(
                            height: percentWidth(20),
                            width: percentWidth(20),
                            // clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: kPrimaryColor.withOpacity(.6), width: 1.5),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/product-image-1.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: kPrimaryColor.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            // child: Image.asset(
                            //   'assets/images/product-image-1.jpg',
                            //   fit: BoxFit.cover,
                            //   height: percentWidth(20),
                            //   width: percentWidth(20),
                            // ),
                          ),
                          SizedBox(
                            width: percentWidth(5),
                          )
                        ]);
                      }),
                ),
              ],
            ),
            SizedBox(
              height: percentHeight(7),
              child: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {},
                ),
                // title: Image.asset(
                //   'assets/logos/fluthut-logo-website-retina.png',
                //   fit: BoxFit.contain,
                //   width: percentWidth(38),
                // ),
                actions: [
                  // IconButton(
                  //   icon: Icon(Icons.chat_bubble_outline, color: Colors.black87),
                  //   onPressed: () {},
                  // ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart_outlined,
                        color: Colors.black87),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
