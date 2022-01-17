import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/search_bar.dart';

class ProductSearch extends StatefulWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          "FlutHut",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
              icon: Icon(Icons.search,color: Colors.blue,)),
          IconButton(
            icon: Icon(Icons.filter_alt_outlined, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [

          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text(
                  "Best Match",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Top Rated",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Price Low-High",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.only(left: 10,right: 10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))
                    ),
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)
                      ),
                      child: Stack(
                        children: [
                          Image.asset('assets/images/blackshirt.jpg',height: 150,width: 200,fit: BoxFit.fitWidth,),
                          Container(
                            margin: EdgeInsets.only(top: 240,left: 140),
                            height: 30,width: 50,
                            child: Stack(
                              children: [
                               Ink(
                                 decoration: BoxDecoration(
                                   gradient: LinearGradient(colors: [Colors.redAccent,Colors.red],
                                   begin: Alignment.topLeft,
                                   end: Alignment.topRight,),
                                   borderRadius: BorderRadius.circular(10.0),
                                 ),

                               ),
                                Center(
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.white,size: 15,),
                                      Text('4.9',style: TextStyle(
                                        color: Colors.white
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 240,left: 5),
                            child: Text('24.99'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                ),
          ),



        ],
      ),


    );

  }


}
