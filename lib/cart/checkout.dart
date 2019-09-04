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
  State<StatefulWidget> createState() => check_out();
}

class check_out extends State<Checkout> {
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

    final double height = MediaQuery.of(context).size.height;
    int counter = 0;
    AppBar appBar = new AppBar(
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

    return new Scaffold(
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
                                      color: Colors.blue,
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
                                    onPressed: null)
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              )))),
          _verticalDivider(),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Delivery Address',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Container(
            height: 165.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 56.0,
                  child: Card(
                    elevation: 3.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                            alignment: Alignment.center,
                            child: IconButton(
                                icon: Icon(Icons.add), onPressed: null)),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 165.0,
                  width: 200.0,
                  margin: EdgeInsets.all(7.0),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'Naomi A. Schultz',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    '2585 Columbia Boulevard',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'Salisbury',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'MD 21801',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 00.0,
                                        top: 05.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Delivery Address',
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
                Container(
                  height: 130.0,
                  width: 200.0,
                  margin: EdgeInsets.all(7.0),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Text(
                                    'Lisa J. Cunningham',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    '49 Bagwell Avenue',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    'Ocala',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  _verticalDivider(),
                                  new Text(
                                    ' FL 34471',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 13.0,
                                        letterSpacing: 0.5),
                                  ),
                                  new Container(
                                    margin: EdgeInsets.only(
                                        left: 00.0,
                                        top: 05.0,
                                        right: 0.0,
                                        bottom: 5.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          'Delivery Address',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.black12,
                                          ),
                                        ),
                                        _verticalD(),
                                        new Checkbox(
                                          value: checkboxValueB,
                                          onChanged: (bool value) {
                                            setState(() {
                                              checkboxValueB = value;
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
            height: 170.0,
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (BuildContext cont, int index) {
                return SafeArea(
                  child: Column(
                    children: <Widget>[
                      Divider(height: 15.0),
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
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            Text(cartList[index]['quantity'].toString(),
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                            Text("₹ " + cartList[index]['pricers'],
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left:20.0,top:5,bottom:5),
            height: 50.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Shipping",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
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
          Container(
              alignment: Alignment.bottomLeft,
              height: 50.0,
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
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide:
                                BorderSide(color: Colors.amber.shade500),
                            child: const Text('CONFIRM ORDER'),
                            textColor: Colors.amber.shade500,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cart()));
                            },
                            shape: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
