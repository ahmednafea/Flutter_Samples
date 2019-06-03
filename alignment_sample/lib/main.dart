import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alert Dialog',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Alert Dialog'),
          ),
          body: MyLayout()),
    );
  }
}
class MyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("align"),
      ),
      body:Container(
        padding: EdgeInsets.all(15.0),
        child:
        Align(
          alignment: Alignment.bottomLeft,
          child: Text('Left botom', textScaleFactor: 1.5,),
        ),
      )
    );
  }
}