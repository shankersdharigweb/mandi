import 'package:flutter/material.dart';
import 'package:onlinemandi/sidebar.dart';
import 'package:onlinemandi/login.dart';
import 'package:onlinemandi/banners.dart';

class Guest extends StatefulWidget {
  final String title;

  const Guest({Key key, this.title}) : super(key: key);

  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  final _formKey = GlobalKey<FormState>();
  TextStyle style = TextStyle(fontSize: 15.0);
  OutlineInputBorder border_style =
  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(35.0)));
  String _currentCities;
  String _currentStates;
  List _states = [
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
  ];
  List _cities = ["Ambala", "Chandigarh", "Mohali", "Panchkula", "Rajpura"];
  List<DropdownMenuItem<String>> dropDownMenuStates;
  List<DropdownMenuItem<String>> dropDownMenuCities;
  @override
  void initState() {
    dropDownMenuStates = getDropDownMenuItems();
    _currentStates = dropDownMenuStates[0].value;

    dropDownMenuCities = getDropDownMenuCities();
    _currentCities = dropDownMenuCities[0].value;
    super.initState();
  }

  bool agree = false;
  bool _autoValidate = false;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String states in _states) {
      items.add(new DropdownMenuItem(value: states, child: new Text(states)));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownMenuCities() {
    List<DropdownMenuItem<String>> items = new List();
    for (String cities in _cities) {
      items.add(new DropdownMenuItem(value: cities, child: new Text(cities)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    final phone = TextFormField(
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        hintText: "Phone Number",
        border: border_style,
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Phone Number is required!';
        }else if (!regExp.hasMatch(value)) {
          return 'Please enter valid mobile number';
        }else
        if (value.trim().length < 8) {
          return 'Invalid phone number!';
        }
      },
    );
    final address = TextFormField(
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        hintText: "Address",
        border: border_style,
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Address is required!';
        }
      },
    );
    final GuestButon = Material(
      child:RaisedButton(
        color: Colors.green,
        padding: EdgeInsets.only(top: 15, left: 30, bottom: 15, right: 30),
        child: Text(
          "Save & Continue",
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
    );;
    return MaterialApp(
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
          autovalidate: _autoValidate,
          child: Center(
            child: Container(
              height: 1000,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    phone,
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 20),
                        border: border_style,
                      ),
                      hint: Text("Select State"),
                      value: _currentStates,
                      items: dropDownMenuStates,
                      onChanged: changedDropDownStates,
                    ),
                    SizedBox(height: 10.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 10, right: 10, top: 0, bottom: 20),
                        border: border_style,
                      ),
                      hint: Text("Select City"),
                      value: _currentCities,
                      items: dropDownMenuCities,
                      onChanged: changedDropDownCities,
                    ),
                    SizedBox(height: 10.0),
                    address,
                    SizedBox(height: 10.0),
                    Center(
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: agree,
                            onChanged: (bool value) {
                              setState(
                                    () {
                                  agree = value;
                                },
                              );
                            },

                          ),
                          Text("I Agree to Terms & Conditions"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GuestButon,
                    SizedBox(height: 10.0),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Already have an account? "),
                          InkWell(
                            child: Text(
                              "Login now",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Login(
                                  title: "Login",
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

  void changedDropDownStates(String selectedStates) {
    setState(() {
      _currentStates = selectedStates;
    });
  }

  void changedDropDownCities(String selectedCities) {
    setState(() {
      _currentStates = selectedCities;
    });
  }
}
