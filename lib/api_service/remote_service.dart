// This file can be named as repository remote service or something like that.

import 'dart:convert';

import 'package:fluthut/models/all_products_model/all_products_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<List<ProductsModel>?> getProducts() async {
    String url = "https://fluthut.oxience.com/wp-json/wc/v3/products?per_page=100&publish=true&consumer_key=ck_94287ba676e5be4cc26a4c4dd4e7d738e0abddb3&consumer_secret=cs_725c143ea6f2d8d9e988df7111d21def45c15f6a";
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // var jsonString = jsonDecode(response.body);
      // var data = jsonEncode(jsonString['data']);
      // print(data);

      return productsModelFromJson(response.body);
    } else {
      return null;
    }
  }
}