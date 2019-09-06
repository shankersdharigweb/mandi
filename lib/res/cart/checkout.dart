import 'package:flutter/material.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:onlinemandi/res/banners.dart';
import 'package:onlinemandi/res/cart/cart.dart';
import 'package:onlinemandi/res/cart/payment.dart';

class Checkout extends StatefulWidget {
  final String title;

  const Checkout({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => check_out();
}

class check_out extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = false;
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
  var addressList = [
    {
      "name": "Hari Shanker",
      "address": "# 156 Mauli Jagran 2",
      "phone_number": "8699623270",
      "state": "Chandigarh",
      "city": "Chandigarh",
      "pincode": "160102",
    },
    {
      "name": "Hari",
      "address": "# 265 Sector 22",
      "phone_number": "9485612548",
      "state": "Haryana",
      "city": "Panchkula",
      "pincode": "160022"
    },
    {
      "name": "Shanker",
      "address": "# 105 Sector 20",
      "phone_number": "8695352641",
      "state": "Chandigarh",
      "city": "Chandigarh",
      "pincode": "160019"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double total = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      double price = double.parse(cartList[i]['pricers']);
      total = total + price;
    }
    double subtotal = total;
    String shipping_price = '0.0';
    if (total < 1000) {
      total = total + 20.0;
      shipping_price = '20.0';
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
    return MaterialApp(

        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
        home: Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      drawer: new Drawer(
        child: Sidebar(),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              child: Container(
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
                                        color: Colors.black),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.green,
                                      ),
                                      onPressed: null)
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
                                        color: Colors.black38),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Colors.black38,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Payment(
                                          title: "Checkout",
                                        );
                                      }));
                                    },
                                  ),
                                ],
                              ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 0.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Delivery Address',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Container(
            height: 175.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: addressList.length,
              itemBuilder: (BuildContext cont, int index) {
                //bool checkboxValueA[index] = false;
                return SafeArea(
                  child: Row(
                    children: <Widget>[
                      addAddress(index),
                      Container(
                        height: 175.0,
                        width: 200.0,
                        margin: EdgeInsets.all(5.0),
                        child: Card(
                          elevation: 3.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 12.0,
                                        top: 5.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        _verticalDivider(),
                                        new Text(
                                          addressList[index]['name'],
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          addressList[index]['address'] +"\nPincode: "+ addressList[index]['pincode'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          addressList[index]['city'] +", "+ addressList[index]['state'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Text(
                                          addressList[index]['phone_number'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13.0,
                                              letterSpacing: 0.5),
                                        ),
                                        _verticalDivider(),
                                        new Container(
                                          margin: EdgeInsets.all(0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                'Select Address',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                              _verticalD(),
                                              new Checkbox(
                                                value: checkboxValueA,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    checkboxValueA = value;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          _verticalDivider(),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Order Summary',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
            height: 180.0,
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (BuildContext cont, int index) {
                double item_price = double.parse(cartList[index]['pricers']);
                return SafeArea(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(cartList[index]['name'],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                            Text(cartList[index]['quantity'].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            Text("₹ $item_price",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Divider(height: 15.0),
                      Shipingdata(index, shipping_price),
                    ],
                  ),
                );
              },
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
                      '\₹  $total',
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: new Text(
                          "PROCEED TO PAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // gives padding to the button
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(
                                        title: "Checkout",
                                      )));
                        },
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
      ),
    );
  }

  Shipingdata(index, shipping_price) {
    if (index == (cartList.length - 1)) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Shipping Charges",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                Text("",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                Text("₹ $shipping_price",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(height: 15.0),
        ],
      );
    }
    return Container();
  }

  addAddress(index) {
    if (index == 0) {
      return Container(
        width: 56.0,
        child: Card(
          elevation: 3.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                  alignment: Alignment.center,
                  child: IconButton(icon: Icon(Icons.add), onPressed: null)),
            ],
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
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
