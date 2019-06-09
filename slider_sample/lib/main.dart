import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  double _value = 0.0;

  void _setvalue(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider Sample'),
        ),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
                child: Column(children: <Widget>[
                  Text('Value: ${(_value * 100).round()}'),
                  Slider(value: _value, onChanged: _setvalue)
                ]))));
  }
}