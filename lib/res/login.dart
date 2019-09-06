import 'package:flutter/material.dart';
import 'package:onlinemandi/res/sidebar.dart';
import 'package:onlinemandi/res/register.dart';
import 'package:onlinemandi/res/banners.dart';

class Login extends StatefulWidget {
  final String title;

  const Login({Key key, this.title}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  TextStyle style = TextStyle(fontSize: 15.0);
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  OutlineInputBorder border_style =
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(35.0)));

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        hintText: "Email or Mobile Number",
        border: border_style,
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Email or Mobile is required';
        }
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (val) => _email = val,
    );
    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        hintText: "Password",
        border: border_style,
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Password is required!';
        }
      },
      keyboardType: TextInputType.text,
      onSaved: (val) => _password = val,
    );
    final loginButon = Material(
      child:RaisedButton(
        color: Colors.green,
        padding: EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Banners(
                title: "OnlineMandi",
              );
            }));
          }
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
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
        body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    emailField,
                    SizedBox(height: 15.0),
                    passwordField,
                    SizedBox(height: 15.0),
                    Row(
                        children: <Widget>[
                          loginButon,
                        ],
                      ),
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account? "),
                          InkWell(
                            child: Text(
                              "Sign up now",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Register(
                                  title: "Sign Up ",
                                );
                              }));
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
