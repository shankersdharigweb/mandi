import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  var cartList;
  List<String> _weights = ["1 KG", "2 KG", "3 KG", "4 KG"];
  List<DropdownMenuItem<String>> dropDownMenuWeights;
  String _currentWeights;

  @override
  CartItems(this.cartList);

  List<DropdownMenuItem<String>> getDropDownMenuWeights() {
    List<DropdownMenuItem<String>> items = new List();
    for (String states in _weights) {
      items.add(new DropdownMenuItem(value: states, child: new Text(states)));
    }
    return items;
  }

  Widget _buildProductItem(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    String selected;
    OutlineInputBorder border_style = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(1.0)));
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 0, left: 5, right: 5),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: size.width * 0.3,
              margin: EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                  border: new Border.all(color: const Color(0xFFeeeeee))),
              child: Image.network(
                'http://onlinemandi.com/uploads/products/medium/' +
                    cartList[index]['picture'],
              ),
            ),
            Container(
              width: size.width * 0.3,
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        cartList[index]['name'],
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16.0,
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
                        cartList[index]['hname'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "₹ " + cartList[index]['pricers'],
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
            Container(
              padding: EdgeInsets.all(5.0),
              width: size.width * 0.3,
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      child: Text(
                        "₹ " + cartList[index]['pricers'],
                      ),
                    ),
                  ],
                ),
              ),
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
      itemCount: cartList.length,
    );
  }

  void changedDropDownWeights(String selectedWeights) {
    _currentWeights = selectedWeights;
  }
}
