import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      _buildProductCard(
          'assets/cadbury.jpeg', 'Cadbury Choclate', 10.0, 273, true),
      _buildProductCard(
          'assets/chepsy.jpg', 'Chepsy Khal we Malh', 5.0, 121, false),
      _buildProductCard('assets/pepsi.jpg', 'Pepsi Can 330 ml', 5.0, 135, false)
    ], scrollDirection: Axis.horizontal);
  }

  _buildProductCard(String imgPath, String foodName, double price, int calCount,
      bool hasMilk) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 10.0, bottom: 10.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 3.0,
                  spreadRadius: 3.0)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                Positioned(
                    top: 92.0,
                    left: 60.0,
                    child: hasMilk
                        ? Container(
                            height: 15.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xFFF75A4C),
                                  style: BorderStyle.solid,
                                  width: 0.25),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Text(
                                'with milk',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 10.0,
                                    color: Color(0xFFF75A4C)),
                              ),
                            ),
                          )
                        : Container())
              ],
            ),
            Container(
              width: 125.0,
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                foodName,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF440206),
                    fontSize: 15.0),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 4.0),
              child: Text(
                '\$' + price.toString(),
                style: TextStyle(
                    fontFamily: 'Montserrat', color: Color(0xFFF75A4C)),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.account_box,
                        color: Color(0xFFF75A4C), size: 15.0),
                    SizedBox(width: 5.0),
                    Text(
                      calCount.toString() + 'cal',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: Colors.grey),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
