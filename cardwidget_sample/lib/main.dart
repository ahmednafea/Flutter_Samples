import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CardWidget Sample",
      home: Scaffold(
        appBar: AppBar(title: Text("CardWidget Sample")),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            padding: EdgeInsets.all(15.0),
            color: Colors.blue,
            width: 300,
            height: 100,
            child:Row(
              children:[
                Text("CardWidget",style: TextStyle(color: Colors.amber,fontSize: 40.0),),
                Icon(Icons.dashboard,color: Colors.amber,)
          ]),
        ),
      ),
    )
    );
  }
}