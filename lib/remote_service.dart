// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'Model/productModel.dart';
//
// class RemoteService {
//   static Future<List<Product>?> getProduct() async {
//     String url = 'https://happybuy.appsticit.com/getallproductdata';
//     Uri uri = Uri.parse(url);
//
//     var responce = await http.get(uri);
//
//     if (responce.statusCode == 200) {
//       var jsonString = jsonDecode(responce.body);
//
//       var product = jsonEncode(jsonString['data']);
//
//       return productFromJson(product);
//     }
//
//     return null;
//   }
// }