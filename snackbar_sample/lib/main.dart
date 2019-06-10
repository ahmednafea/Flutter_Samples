import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        title: "Sliver AppBar");
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldstate =
  new GlobalKey<ScaffoldState>();

  void _showBar() {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
        content: new Text('Snack',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.tealAccent))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldstate,
        appBar: AppBar(title: Text("SnackBar"), backgroundColor: Colors.teal),
        body: Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
                child: Column(children: <Widget>[
                  RaisedButton(
                      onPressed: _showBar,
                      child: Text("Click", style: TextStyle(fontSize: 20.0)))
                ]))));
  }
}
