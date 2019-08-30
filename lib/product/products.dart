import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  final productList;
  var counter;

  @override
  Products(this.productList, this.counter);

  @override
  _ProductsState createState() => new _ProductsState();
}

class _ProductsState extends State<Products> {
  List<String> _weights = ["1 KG", "2 KG", "3 KG", "4 KG", "5 KG", "6 KG"];
  List<DropdownMenuItem<String>> dropDownMenuWeights;
  bool agree = false;
  List<DropdownMenuItem<String>> getDropDownMenuWeights() {
    List<DropdownMenuItem<String>> items = new List();
    for (String states in _weights) {
      items.add(new DropdownMenuItem(value: states, child: new Text(states)));
    }
    return items;
  }
  var _currentWeight;
  Widget _buildProductItem(BuildContext context, int index) {

    @override
    void initState() {
      dropDownMenuWeights = getDropDownMenuWeights();
      _currentWeight = dropDownMenuWeights[2].value;
      super.initState();
    }

    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border_style = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0)));
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: size.width * 0.5,
                  height:120,
                  child: Image.network(
                    'http://onlinemandi.com/uploads/products/medium/' +
                        widget.productList[index]['picture'],
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  height:120,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.productList[index]['name'],
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.productList[index]['hname'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Text(
                            "₹ " + widget.productList[index]['pricers'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            " / KG",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  width: size.width * 0.5,
                  height: 65,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 0, bottom: 20),
                      border: border_style,
                    ),
                    hint: Text("Select weight"),
                    value: _currentWeight,
                    items: _weights
                        .map(
                          (label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ),
                        )
                        .toList(),
                      onChanged: (value) {
                        setState(() => _currentWeight = value);
                      },
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 20),
                  width: size.width * 0.4,
                  height: 65,
                  child: RaisedButton(
                    child: new Text(
                      "Add To Cart" + widget.counter.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // gives padding to the button
                    onPressed: () {
                      print("Increment Counter" + widget.counter.toString());
                      setState(() {
                         widget.counter++;
                      },);
                    },
                    color: Colors.green,
                    //color when the button is being actively pressed, quickly fills the button and fades out after
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: widget.productList.length,
    );
  }
}
