import 'package:fluthut/screens/cart_screen/mycart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluthut/size_config.dart';
import 'package:fluthut/components/category_grid.dart';
import 'package:fluthut/components/products_grid.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: kPrimaryColor,
          //   ),
          //   onPressed: () {},
          // ),
          title: Image.asset(
            'assets/logos/fluthut-logo-website-retina.png',
            fit: BoxFit.contain,
            width: percentWidth(38),
          ),
          actions: [
            IconButton(
              icon: Stack(
                alignment: AlignmentDirectional.topEnd,
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.shopping_cart_outlined, color: kSecondaryColor),
                  Positioned(
                    top: -8,
                    right: -5,
                    child: Container(

                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                      decoration: BoxDecoration(color: kPrimaryColor, borderRadius:  BorderRadius.circular(50.0)),
                      child: Text('0'),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder:(context)=> Cart(),),);
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,
                  color: kSecondaryColor),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CategoryGrid(),
              ProductsGrid()
            ],
          ),
        ));
  }
}
