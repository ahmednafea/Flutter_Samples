import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://demos.subinsb.com/isl-profile-pic/image/person.png";
  String otherProfilePicture =
      "https://demos.subinsb.com/isl-profile-pic/image/person.png";

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drawer Sample"),
          backgroundColor: Colors.blue[900],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName:
                      Text("Ahmed Nafea", style: TextStyle(fontSize: 18.0)),
                  accountEmail: Text("ahmedn@silverkeytech.com",
                      style: TextStyle(fontSize: 15.0)),
                  currentAccountPicture: GestureDetector(
                    onTap: () => switchUser(),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture)),
                  ),
                  otherAccountsPictures: <Widget>[
                    GestureDetector(
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(otherProfilePicture)),
                    ),
                  ],
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg")))),
              ListTile(
                  title: Text("First Page", style: TextStyle(fontSize: 20.0)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 20.0),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OtherPage("First Page")));
                  }),
              ListTile(
                  title: Text("Second Page", style: TextStyle(fontSize: 20.0)),
                  trailing: Icon(Icons.arrow_back_ios, size: 20.0),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OtherPage("Second Page")));
                  }),
              Divider(),
              ListTile(
                title: Text("Close", style: TextStyle(fontSize: 15.0)),
                trailing: Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body:
            Center(child: Text("HomePage", style: TextStyle(fontSize: 35.0))));
  }
}

class OtherPage extends StatelessWidget {
  final String pageText;

  OtherPage(this.pageText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageText)),
      body: Center(
        child: Text(pageText),
      ),
    );
  }
}
