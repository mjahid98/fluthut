import 'package:fluthut/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(percentWidth(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  child: Text(
                    'Checkout',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: percentHeight(5),),

                    Text(
                      'Joya',
                      style: TextStyle(fontSize: 32),
                    ),
                    SizedBox(height: percentHeight(2),),
                    Text(
                      'Bangladesh in Sylhet',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'joya@gmail.com',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '8800193764',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: percentHeight(5),),
                Center(
                  child: Row(
                    children: [
                      Image.network(
                        'https://yt3.ggpht.com/ytc/AKedOLRt1d4p7bPylasq_66BIC8-k3hkyVjJ2JICQITK=s900-c-k-c0x00ffffff-no-rj',
                        height: 30,
                      ),

                      Text(
                        'Master Card ending**00',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      )
                    ],
                  ),
                ),
                SizedBox(height: percentHeight(2),),
                Container(
                  child: Row(
                    children: [
                      Padding(
                  padding: EdgeInsets.only(right: 15),
                      child: Image.network(
                  'https://assets-global.website-files.com/5e3c45dea042cf97f3689681/5e417cd336a72b06a86c73e7_Flutter-Tutorial-Header%402x.jpg',
                  height: 30,
                ),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Red cotton Scarf',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text('2ft Dark READ'),
                          Text('\$11.00')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: percentWidth(2),),
                Container(
                  width: percentWidth(50),
                  child:  TextField(

                    onTap: () {
                      setState(() {

                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Coupon',

                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: kSecondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: percentHeight(5),),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: percentHeight(1),),
                        Text(
                          "\$11.00",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: percentHeight(2),),
                        Text('Free Domestic Shipping'),
                        SizedBox(height: percentHeight(2),),
                        ElevatedButton(
                          child: Text(
                            "PLACE ORDER",
                            style: TextStyle(backgroundColor: kPrimaryColor),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
