import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        title: "SlierAppBar");
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://article.images.consumerreports.org/prod/content/dam/CRO%20Images%202018/Cars/June/CR-Cars-InlineHero-2019-BMW-X5-driving-6-18',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => Card(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.brown,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR17d21Bvtz-Ua1w5v8MLQEop69a5XTZcr-jk0ukfTbupRw-g1P"),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "list item",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
