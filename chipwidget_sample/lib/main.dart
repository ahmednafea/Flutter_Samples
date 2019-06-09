import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Chip(),
    );
  }
}

class Chip extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip Input Field Example'),
      ),
      body: Center(
        child: Padding(
          //Add padding around textfield
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: InputChip(
            avatar: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "A Chip input field"),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          ),
        ),
      ),
    );
  }
}
