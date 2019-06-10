import 'package:flutter/material.dart';

void main() =>
    runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Table Sample",
      theme: ThemeData(
          backgroundColor: Colors.teal
      ),
      home: Scaffold(
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child:CircleAvatar(
                  backgroundColor: Colors.teal,
                  backgroundImage: NetworkImage("https://media.wired.com/photos/59267d4dcefba457b079a273/master/w_1856,c_limit/Grindr-Logo-TA.jpg"),
                  maxRadius: 40.0,
                ),),
              Divider(),
              Text("Profile Data",style: TextStyle(fontSize: 22.0,color: Colors.teal)),
              Container(
                child: Padding(padding: const EdgeInsets.all(14.0),
                  child:Table(
                    border: TableBorder.all(width: 1.0,color: Colors.black),
                    children:[
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("ID",style: TextStyle(fontSize: 18.0)),
                              Text("123",style: TextStyle(fontSize: 18.0))
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("Name",style: TextStyle(fontSize: 18.0)),
                              Text("Ahmed",style: TextStyle(fontSize: 18.0))
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("Salary",style: TextStyle(fontSize: 18.0)),
                              Text("2500 L.E",style: TextStyle(fontSize: 18.0))
                            ],
                          ),
                        )
                      ])
                    ] ,
                  ) ,
                ),
              )

            ],
          )
      ),
    );
  }

}