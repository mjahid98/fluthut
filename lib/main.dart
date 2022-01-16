import 'package:fluthut/constants.dart';
import 'package:fluthut/screens/product_search_screen/product_search.dart';
import 'package:fluthut/screens/signin/signin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Fluthut());
}

class Fluthut extends StatelessWidget {
  const Fluthut({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: kPrimaryColor,
          secondary: kSecondaryColor
        ),
      ),
      home: ProductSearch(),
    );
  }
}


