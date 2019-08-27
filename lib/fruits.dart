import 'package:flutter/material.dart';
import 'package:onlinemandi/product/products.dart';
import 'package:onlinemandi/sidebar.dart';
import 'package:onlinemandi/banners.dart';
import 'package:onlinemandi/cart/cart.dart';

class Fruits extends StatefulWidget {
  final String title;

  const Fruits({Key key, this.title}) : super(key: key);

  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  var productList = [
    {
      "pricers": '85',
      "name": "Banana",
      "hname": "Banana",
      "picture": "banana4231.jpg",
      "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '90',
      "name": "Mango",
      "hname": "Banana",
      "picture": "Chounsa9310.jpg",
     "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '120',
      "name": "Apple",
      "hname": "Banana",
      "picture": "apple-green7189.jpg",
     "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '110',
      "name": "Grapes",
      "hname": "Banana",
      "picture": "grapes-black1332.jpg",
     "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '60',
      "name": "Pears",
      "hname": "Banana",
      "picture": "pear4784.jpg",
     "weights" :["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
  ];
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
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
            unselectedLabelColor: Colors.grey[300],
            labelColor: Colors.white,
            indicatorWeight: 2,
            tabs: [
              Tab(
                child: Text("All Fruits"),
              ),
              Tab(
                child: Text("Favorites"),
              ),
              Tab(
                child: Text("Best Selling"),
              ),
            ],
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
