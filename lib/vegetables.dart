import 'package:flutter/material.dart';
import 'package:onlinemandi/product/products.dart';
import 'package:onlinemandi/sidebar.dart';
import 'package:onlinemandi/banners.dart';
import 'package:onlinemandi/cart/cart.dart';

class Vegetables extends StatefulWidget {
  final String title;

  const Vegetables({Key key, this.title}) : super(key: key);

  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  bool value = false;
  var productList = [
    {
      "pricers": '18',
      "name": "Potato",
      "hname": "Banana",
      "picture": "potato984.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '35',
      "name": "Tomato",
      "hname": "Banana",
      "picture": "Tomato3220.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '50',
      "name": "Amla",
      "hname": "Banana",
      "picture": "amla5264.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '30',
      "name": "Arbi",
      "hname": "Banana",
      "picture": "arbi22572.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '60',
      "name": "Bean French",
      "hname": "Banana",
      "picture": "fresho-beans9412.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            ),

            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Cart(
                    title: "Cart",
                  );
                }));
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return Banners(
                    title: "OnlineMandi",
                  );
                }));
              },
            ),
          ],
          bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("All Vegetables"),
                ),
                Tab(
                  child: Text("Favorites"),
                ),
                Tab(
                  child: Text("Best Selling"),
                ),
              ],
            unselectedLabelColor: Colors.grey[300],
            labelColor: Colors.white,
            indicatorWeight: 2,

          ),
        ),
        drawer: new Drawer(
          child: Sidebar(),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(

                    child: Products(productList)),
              ],
            ),
            Center(
              child:Container(
                child: Text("No items found!"),
              ),
            ),
            Center(
              child:Container(
                child: Text("No items found!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
