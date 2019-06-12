import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class Lesson {
  final String name;
  final String imageUrl;
  final String duration;
  final int number;

  Lesson(this.name, this.imageUrl, this.duration, this.number);
}

class MyAppState extends State<MyApp> {
  var IsLoading = false;
  var videos;
  final lessons = new List<Lesson>();

  _FetchData() async {
    final response =
        await http.get("https://api.letsbuildthatapp.com/youtube/home_feed");
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosJson = map["videos"];
      videosJson.forEach((video) {
        setState(() {
          IsLoading = false;
          this.videos = videosJson;
        });
      });
    }
  }

  _fetchLessons() async {
    final urlString =
        'https://api.letsbuildthatapp.com/youtube/course_detail?id=1';
    print("Fetching: " + urlString);
    final response = await http.get(urlString);
    final lessonsJson = json.decode(response.body);
    lessonsJson.forEach((lessonJson) {
      final lesson = new Lesson(lessonJson["name"], lessonJson["imageUrl"],
          lessonJson["duration"], lessonJson["number"]);
      lessons.add(lesson);
    });
    setState(() {
      IsLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "More Than Widget",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Frist Page"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      IsLoading = true;
                    });
                    _FetchData();
                  })
            ],
          ),
          body: Center(
            child: IsLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: videos != null ? videos.length : 0,
                    itemBuilder: (context, i) {
                      final video = this.videos[i];
                      return FlatButton(
                        onPressed: () {
                          print("Video No $i");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MaterialApp(
                                      home: Scaffold(
                                          appBar: AppBar(
                                            title: Text("Second Page"),
                                            centerTitle: true,
                                            actions: <Widget>[
                                              IconButton(
                                                  icon: Icon(Icons.refresh),
                                                  onPressed: () {
                                                    setState(() {
                                                      IsLoading = true;
                                                    });
                                                    _fetchLessons();
                                                  })
                                            ],
                                          ),
                                          body: Center(
                                              child: ListView.builder(
                                                  itemCount: lessons != null
                                                      ? lessons.length
                                                      : 0,
                                                  itemBuilder: (context, i) {
                                                    return Column(
                                                      children: <Widget>[
                                                        Padding(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Image.network(
                                                                  lessons[i]
                                                                      .imageUrl),
                                                              Text(
                                                                "NO: " +
                                                                    lessons[i]
                                                                        .number
                                                                        .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .indigo,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                lessons[i].name,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .indigo,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                lessons[i]
                                                                        .duration +
                                                                    " Minutes",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .indigo,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                        ),
                                                        Divider()
                                                      ],
                                                    );
                                                  }))))));
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.network(video["imageUrl"]),
                                  Text(
                                    video["name"],
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(10.0),
                            ),
                            Divider()
                          ],
                        ),
                      );
                    }),
          ),
        ));
  }
}
