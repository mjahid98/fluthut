import 'package:flutter/material.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The search area here
          title: Container(
            height: 51,
            margin: EdgeInsets.only(left: 10, right: 10,top: 5,bottom: 5),
            child: Row(
              children: [
                Flexible(child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xffe6e6ec),
                    filled: true,
                  ),
                ),),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),),
    );
  }
}