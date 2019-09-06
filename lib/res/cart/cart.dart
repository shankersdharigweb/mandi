import 'package:flutter/material.dart';
import 'package:onlinemandi/res/product/products.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:onlinemandi/res/banners.dart';
import 'package:onlinemandi/res/cart/cartItems.dart';
import 'package:onlinemandi/res/cart/checkout.dart';

class Cart extends StatefulWidget {
  final String title;

  const Cart({Key key, this.title}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
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
        "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
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
        "weights": ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG"]
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

    double total = 0.0;
    for(int i=0;i<cartList.length;i++){
      double price =   double.parse(cartList[i]['pricers']);
      total = total + price;
    }
    double subtotal = total;
    String shipping_price = '0.0';
    if(total < 1000){
        total = total + 20.0;
        shipping_price = '20.0';
    }

    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home:Scaffold(
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
          ],
        ),
        drawer: new Drawer(
          child: Sidebar(),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: CartItems(cartList)),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: const Color(0xFFeeeeee)),
                  borderRadius: BorderRadius.all(Radius.circular(
                          5.0) //                 <--- border radius here
                      ),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Sub Total",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Shipping Charges",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "₹ $subtotal" ,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "₹ "+ shipping_price,
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "₹ $total" ,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              Container(
                color: Theme.of(context).primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Empty Cart',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Banners(
                            title: "OnlineMandi",
                          );
                        }));
                      },
                    ),
                    VerticalDivider(
                      color: Colors.white,
                    ),
                    FlatButton(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
