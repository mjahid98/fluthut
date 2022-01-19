import 'package:flutter/material.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.indigo,
          title: Center(child:Text('CART'),),
         leading: IconButton(onPressed: (){Navigator.pop(context);},
             icon:Icon(Icons.arrow_back),
         color: Colors.black38),
          actions: [
            IconButton(
              icon:Icon(
              Icons.search,
              color:Colors.white) , onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.deepPurple,
          child: Row(
            children: [
              Expanded(child: ListTile(
                title: Text('TOTAL'),
                subtitle: Text('\$3600'),
              ),
              ),
              Expanded(child: MaterialButton(onPressed: (){},
              child: Text('Chack out',
                style: TextStyle(color: Colors.white),),
                color: Colors.blue,
              ))
            ],

          ),
        ),
body:
Column(children: [
  Row(
      mainAxisAlignment :MainAxisAlignment.start,
      children: [Text('01',),
        Container(
          height: 110,
          width: 150,
          child: Image.asset('assets/images/product-image-1.jpg'),
        ),
        Column(children: [
          Text('WIRELESS HEADPHONE'),
          TextButton(onPressed: (){}, child:Text('\$500'))
        ],)
      ],
  ),
  Row(
      mainAxisAlignment :MainAxisAlignment.start,
      children: [Text('02',),
        Container(
          height: 110,
          width: 150,
          child: Image.asset('assets/images/product-image-1.jpg'),
        ),
        Column(children: [
          Text('WOMAN BAG'),
          TextButton(onPressed: (){}, child:Text('\$1200'))
        ],)
      ],
  ),
  Row(
      mainAxisAlignment :MainAxisAlignment.start,
      children: [Text('03',),
        Container(
          height: 110,
          width: 150,
          child: Image.asset('assets/images/product-image-1.jpg'),
        ),
        Column(children: [
          Text('SHOE FOR MAN'),
          TextButton(onPressed: (){}, child:Text('\$1900'))
        ],)
      ],
  ),

],),),
    );


  }
}
