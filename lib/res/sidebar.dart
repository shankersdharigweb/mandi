import 'package:flutter/material.dart';
import 'package:onlinemandi/res/fruits.dart';
import 'package:onlinemandi/res/register.dart';
import 'package:onlinemandi/res/vegetables.dart';
import 'package:onlinemandi/res/login.dart';
import 'package:onlinemandi/main.dart';

class Sidebar extends StatelessWidget {
  Widget _buildSidebar(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        DrawerHeader(
          padding: EdgeInsets.all(0),
          child: Container(
            height: 300,
            child: UserAccountsDrawerHeader(
              accountName: Text("Hari Shanker"),
              accountEmail: Text("gurpal.gwebs@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "HS",
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ),
        ),
        new ListTile(
          leading: FlatButton(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Login(
                  title: "Login",
                );
              }));
            },
          ),
        ),
        Divider(),
        new ListTile(
          leading: FlatButton(
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Register(
                  title: "Sign Up",
                );
              }));
            },
          ),
        ),
        Divider(),
        new ListTile(
          leading: FlatButton(
            child: Text(
              "Fruits",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Fruits(
                  title: "Fruits",
                );
              }));
            },
          ),
        ),
        Divider(),
        new ListTile(
          leading: FlatButton(
            child: Text(
              "Vegetables",
              style: TextStyle(fontSize: 17.0),
              textAlign: TextAlign.left,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Vegetables(
                  title: "Vegetables",
                );
              }));
            },
          ),
        ),
        Divider(),
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildSidebar,
      itemCount: 1,
    );
  }
}
