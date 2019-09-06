import 'package:flutter/material.dart';
import 'package:onlinemandi/res/fruits.dart';
import 'package:onlinemandi/res/vegetables.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Banners extends StatefulWidget {
  final String title;

  const Banners({Key key, this.title}) : super(key: key);

  @override
  _BannersState createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int _value = 6;
  var bannerList = [
    {
      "image": "fruits1619.jpg",
      "route": Fruits(
        title: "All Fruits",
      ),
    },
    {
      "image": "veg5743.jpg",
      "route": Vegetables(
        title: "All Fruits",
      ),
    },
    {
      "image": "delivery9417.jpg",
      "route": Fruits(
        title: "All Fruits",
      ),
    },
    {
      "image": "app1320.jpg",
      "route": Vegetables(
        title: "All Vegetables",
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    double height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
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
          ],
        ),
        drawer: new Drawer(
          child: Sidebar(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            SizedBox(height: 10.0),
            Stack(
              children: [
                CarouselSlider(
                  items: bannerList.map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              child: Image.network(
                                "http://onlinemandi.com/uploads/banners/large/" +
                                    i["image"],
                                //fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              padding: EdgeInsets.all(0.0),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return i["route"];
                                    },
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                  autoPlay: true,
                  aspectRatio: 1.0,
                  height: 150,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              child: new FlatButton(
                child: Image.network(
                    "http://onlinemandi.com/uploads/banners/large/fruits1619.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Fruits(
                      title: "Fruits",
                    );
                  }));
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: new FlatButton(
                child: Image.network(
                    "http://onlinemandi.com/uploads/banners/large/veg5743.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Vegetables(
                      title: "Vegetables",
                    );
                  }));
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: new FlatButton(
                child: Image.network(
                    "http://onlinemandi.com/uploads/banners/large/delivery9417.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Fruits(
                      title: "Fruits",
                    );
                  }));
                },
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              child: new FlatButton(
                child: Image.network(
                  "http://onlinemandi.com/uploads/banners/large/app1320.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 140,
                ),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Fruits(
                          title: "Fruits",
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
