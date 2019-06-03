import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('AppBar Sample', style: TextStyle(color: Colors.blue),),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.playlist_play, color: Colors.blue,),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add, color: Colors.blue,),
            ),
            IconButton(
              icon: Icon(Icons.playlist_add_check, color: Colors.blue,),
            ),
          ],
        ),
        body: Container(
          color: Colors.blue,
          child: Text("A.N Design", style: TextStyle(inherit: true, fontSize: 32.0, color: Colors.tealAccent),),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}