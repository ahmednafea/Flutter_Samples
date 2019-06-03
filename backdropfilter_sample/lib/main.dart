import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Backdrop Filter Sample',
      home: Scaffold(
        appBar: AppBar(title: Text("Backdrop Filter Sample"),),
        body: Stack(
          children: <Widget>[
            ConstrainedBox(
              child: Image.network("https://d37jf9ptvshhdu.cloudfront.net/imgs/5060_217919be-2019-bmw-x7-38-large.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
              constraints: BoxConstraints.expand(),
            ),
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 6),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100.withOpacity(0.2),
                    )
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}