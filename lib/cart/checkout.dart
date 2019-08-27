import 'package:flutter/material.dart';
import 'package:onlinemandi/product/products.dart';
import 'package:onlinemandi/sidebar.dart';
import 'package:onlinemandi/banners.dart';
import 'package:onlinemandi/cart/cartItems.dart';
import 'package:onlinemandi/cart/cart.dart';

class Checkout extends StatefulWidget {
  final String title;

  const Checkout({Key key, this.title}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  var cartList = [
    {
      "pricers": '85',
      "name": "Banana",
      "hname": "Banana",
      "picture": "banana4231.jpg",
      "quantity": "1 KG",
    },
    {
      "pricers": '90',
      "name": "Mango",
      "hname": "Banana",
      "picture": "Chounsa9310.jpg",
      "quantity": "1 KG",
    },
    {
      "pricers": '120',
      "name": "Apple",
      "hname": "Banana",
      "picture": "apple-green7189.jpg",
      "quantity": "1 KG",
    },
    {
      "pricers": '110',
      "name": "Grapes",
      "hname": "Banana",
      "picture": "grapes-black1332.jpg",
      "quantity": "1 KG",
    },
    {
      "pricers": '60',
      "name": "Pears",
      "hname": "Banana",
      "picture": "pear4784.jpg",
      "quantity": "1 KG",
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
            IconButton(
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
          ],
        ),
        drawer: new Drawer(
          child: Sidebar(),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: CartItems(cartList)),
            ],
          ),
        ),
      ),
    );
  }
}
