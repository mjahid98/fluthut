import 'package:fluthut/components/search_bar.dart';
import 'package:fluthut/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isVisible = false;
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 0.1,
          shadowColor: Colors.indigo.withOpacity(.2),
          backgroundColor: Colors.white,
          title: Center(
            child: isVisible == true
                ? Visibility(child: SearchBar())
                : Text(
                    'CART',
                    style: TextStyle(color: kPrimaryColor),
                  ),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: kPrimaryColor),

          actions: [
            IconButton(
              icon: Icon(isVisible == false ? Icons.search : Icons.close,
                  color: kSecondaryColor),
              onPressed: () {
                setState(() {
                  isVisible == false ? isVisible = true : isVisible = false;
                });
              },
            ),
          ],
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(
              bottom: percentWidth(3),
              top: percentWidth(3),
              right: percentWidth(6),
              left: percentWidth(6),
            ),
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   '0${index + 1}',
                      // ),
                      Container(
                        height: percentWidth(20),
                        width: percentWidth(20),
                        margin: EdgeInsets.only(right: 10),
                        // clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: kPrimaryColor.withOpacity(.6), width: 1.5),
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
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        // child: Image.asset(
                        //   'assets/images/product-image-1.jpg',
                        //   fit: BoxFit.cover,
                        //   height: percentWidth(20),
                        //   width: percentWidth(20),
                        // ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'WIRELESS HEADPHONE',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: percentWidth(4)),
                          ),
                          SizedBox(height: percentWidth(2)),
                          Container(
                            width: percentWidth(55),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$500',
                                    style: TextStyle(color: kPrimaryColor),
                                  ),
                                  //The quantity
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              qty > 1 ? qty--: qty;
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.remove)),
                                        Text(
                                          '$qty',
                                          style: TextStyle(
                                              color: kSecondaryColor, fontSize: 16),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              qty++;
                                              setState(() {});
                                            },
                                            icon: Icon(Icons.add)),
                                      ],
                                    ),
                                  )

                                ]),
                          )
                        ],
                      ),
                      SizedBox(
                        width: percentWidth(5),
                      )
                    ]),
              );
            }),
        bottomNavigationBar: Container(
          // color: Colors.deepPurple,
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('TOTAL'),
                  subtitle: Text('\$3600'),
                ),
              ),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder:(context)=> Checkout(),),);
                },
                child: Text(
                  'Chack out',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
