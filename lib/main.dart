import 'package:fluthut/constants.dart';
import 'package:fluthut/screens/home/homescreen.dart';
import 'package:fluthut/screens/product_search_screen/product_search.dart';
import 'package:fluthut/screens/signin/signin.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
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
      home: SignInScreen(),
      // home: ProductSearchScreen(),
      // home: HomeScreen(),
    );
  }
}


