import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  _CategoryGridState createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6),
      itemCount: 8,
      itemBuilder: (BuildContext ctx, index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: kPrimaryShadowColor,
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          elevation: 5,
          child: Container(
            // clipBehavior: Clip.antiAlias,
            padding: EdgeInsets.all(14),
            child: SvgPicture.asset(
              'assets/images/category-icon.svg',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
