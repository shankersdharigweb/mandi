import 'package:flutter/material.dart';
import 'package:onlinemandi/res/login.dart';
import 'package:onlinemandi/res/register.dart';
import 'package:onlinemandi/res/guest.dart';
import 'package:onlinemandi/res/loader.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var title;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'OnlineMandi',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: _buildText(context),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    final button1 = new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new RaisedButton(
        child: new Text("Login"),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Login(
                  title: "Login",
                );
              },
            ),
          );
        },
        color: Colors.black,
        //specify background color for the button here
        colorBrightness: Brightness.dark,
        //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
        disabledColor: Colors.blueGrey,
        // specify color when the button is disabled
        highlightColor: Colors.green,
        //color when the button is being actively pressed, quickly fills the button and fades out after
        padding: EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 15.0), // gives padding to the button
      ),
    );
    final button2 = new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new RaisedButton(
        child: new Text("Sign Up"),

        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Register(
                  title: "Sign Up",
                );
              },
            ),
          );
        },
        //color when the button is being actively pressed, quickly fills the button and fades out after
        padding: EdgeInsets.symmetric(
            horizontal: 8.0, vertical: 15.0), // gives padding to the button
      ),
    );

    final button3 = new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new RaisedButton(
        child: new Text("Continue as Guest"),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
        // gives padding to the button
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Guest(
                  title: "Guest Registration",
                );
              },
            ),
          );
        },
        color: Colors.green,
        //specify background color for the button here
        colorBrightness: Brightness.dark,
        //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
        disabledColor: Colors.blueGrey,
        // specify color when the button is disabled
        highlightColor: Colors.green,
        //color when the button is being actively pressed, quickly fills the button and fades out after
      ),
    );
    return ListView(
      padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
      children: <Widget>[
        //PreLoader(),
        SizedBox(height: 15.0),
        Container(
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w500,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          child: Text(
            "To",
            style: TextStyle(fontSize: 15.0),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          child: Text(
            "OnlineMandi",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          child: Text(
            "One Of The India's Best Online Fruits & Vegetable Market",
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 15.0),
        button1,
        SizedBox(height: 5.0),
        button2,
        SizedBox(height: 5.0),
        button3,
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Image.network(
          "https://www.packtpub.com/sites/default/files/press/logos/packt.png",
        ),
      ),
    );
  }

  Widget _buildSnackBarButton(BuildContext context) {
    return Builder(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            child: RaisedButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("HELLO!"),
                ));
              },
              child: Text("BUTTON"),
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceHolder(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Placeholder(),
      ),
    );
  }

  Widget _buildColumn(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20.0,
              width: 20.0,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.green,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.green,
          ),
          Container(
            height: 20.0,
            width: 20.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
