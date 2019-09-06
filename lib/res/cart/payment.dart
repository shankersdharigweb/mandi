import 'package:flutter/material.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:onlinemandi/res/banners.dart';
import 'package:onlinemandi/res/cart/cart.dart';
import 'package:onlinemandi/res/cart/checkout.dart';

class Payment extends StatefulWidget {
  final String title;

  const Payment({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => paymentFinal();
}

class paymentFinal extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  var cartList = [
    {
      "pricers": '85',
      "name": "Banana",
      "hname": "Banana",
      "picture": "banana4231.jpg",
      "quantity": "1 KG",
    },
    {
      "pricers": '35',
      "name": "Tomato",
      "hname": "Banana",
      "picture": "Tomato3220.jpg",
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
      "pricers": '30',
      "name": "Arbi",
      "hname": "Banana",
      "picture": "arbi22572.jpg",
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
  int radioValue = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double total = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      double price = double.parse(cartList[i]['pricers']);
      total = total + price;
    }
    if (total < 1000) {
      total = total + 20.0;
    }
    int counter = 0;
    AppBar appBar = new AppBar(
      title: new Text(widget.title),
      actions: <Widget>[
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
                padding: EdgeInsets.only(left: 4, right: 4, top: 3, bottom: 3),
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
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Banners(
                title: "OnlineMandi",
              );
            }));
          },
        ),
      ],
    );
    bool success_val = false;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: appBar,
        drawer: new Drawer(
          child: Sidebar(),
        ),
        body: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // three line description
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Delivery',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.black38,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Checkout(
                                                title: "Checkout",
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Payment',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        onPressed: null)
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _verticalDivider(),
            new Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: new Text(
                'Select Payment Method',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            _verticalDivider(),
            new Container(
              height: 150.0,
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Wallet / UPI",
                                  maxLines: 10,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black)),
                              Radio<int>(
                                groupValue: radioValue,
                                value: 1,
                                activeColor: Colors.green,
                                onChanged: (val) {
                                  setState(() {
                                    radioValue = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        _verticalD(),
                        Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Cash on Delivery",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black)),
                                Radio<int>(
                                  groupValue: radioValue,
                                  value: 2,
                                  activeColor: Colors.green,
                                  onChanged: (val) {
                                    setState(() {
                                      radioValue = val;
                                    });
                                  },
                                ),
                              ],
                            )),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: 80.0,
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.info), onPressed: null),
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\₹ $total',
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: new Text(
                          "CONFIRM ORDER",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // gives padding to the button
                        onPressed: () {
                          setState(() {
                            success_val = true;
                          });
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Details()));
                        },
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            successMessage(success_val),
          ],
        ),
      ),
    );
  }

  successMessage(success) {
    if (success == true) {
      return Container(
        margin: EdgeInsets.all(10.0),
        child: Card(
          child: Container(
            color: Colors.green.shade100,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
              child: Text(
                "Your Order has been placed successfully!",
                //maxLines: 10,
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0),
      );
}
