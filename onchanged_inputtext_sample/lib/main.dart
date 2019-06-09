import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyTextInput()));
}

class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Input Text"), backgroundColor: Colors.deepOrange),
        body: Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                          decoration: InputDecoration(hintText: "Type in here"),
                          onChanged: (String str) {
                            setState(() {
                              result = str;
                            });
                          }),
                      Text(result)
                    ]))));
  }
}
