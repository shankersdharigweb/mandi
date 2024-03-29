import 'package:flutter/material.dart';
import 'package:onlinemandi/res/product/products.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:onlinemandi/res/banners.dart';
import 'package:onlinemandi/res/cart/cart.dart';

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
      "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '90',
      "name": "Mango",
      "hname": "Banana",
      "picture": "Chounsa9310.jpg",
      "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '120',
      "name": "Apple",
      "hname": "Banana",
      "picture": "apple-green7189.jpg",
      "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '110',
      "name": "Grapes",
      "hname": "Banana",
      "picture": "grapes-black1332.jpg",
      "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
    {
      "pricers": '60',
      "name": "Pears",
      "hname": "Banana",
      "picture": "pear4784.jpg",
      "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
    },
  ];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    var cartCounting = [];
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
              ),
              new Stack(
                children: <Widget>[
                  new IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Cart(
                          title: "Cart",
                        );
                      }));
                    },
                  ),
                  new Positioned(
                    right: 5,
                    top: 5,
                    child: new Container(
                      padding:
                          EdgeInsets.only(left: 4, right: 4, top: 3, bottom: 3),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
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
                  Expanded(child: Products(productList, counter)),
                ],
              ),
              Center(
                child: Container(
                  child: Text("No items found!"),
                ),
              ),
              Center(
                child: Container(
                  child: Text("No items found!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
