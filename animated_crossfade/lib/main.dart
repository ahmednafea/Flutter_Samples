import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyBody(),
      ),
    );
  }
}

class MyBody extends StatefulWidget {
  @override
  AnimatedCrossFadeState createState() => AnimatedCrossFadeState();
}

class AnimatedCrossFadeState extends State<MyBody> {
  var _first= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedCrossFade Sample"),
      ),
      body: Center(
          child: AnimatedCrossFade(
            duration: const Duration(seconds: 1),
            firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
            secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
            crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          )
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.transform),
          onPressed: () {
            setState(() {
              _first = !_first;
            });
          }
      ),
    );
  }
}