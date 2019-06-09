import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Tabe Navigation Sample"),
            backgroundColor: Colors.blue,
            bottom: TabBar(controller: controller, tabs: <Widget>[
              Tab(icon: Icon(Icons.arrow_forward)),
              Tab(icon: Icon(Icons.arrow_downward)),
              Tab(icon: Icon(Icons.arrow_back))
            ])),
        body: TabBarView(
            controller: controller,
            children: <Widget>[First(), Second(), Third()]));
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Icon(Icons.accessibility_new,
                size: 150.0, color: Colors.brown)));
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Icon(Icons.favorite, size: 150.0, color: Colors.red)));
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Icon(Icons.local_pizza, size: 150.0, color: Colors.teal)));
  }
}
