import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(title: "Popup Menu Button Sample", home: MainActivity()));

class CustomPopupMenu {
  CustomPopupMenu({this.title, this.icon});

  String title;
  IconData icon;
}

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Home', icon: Icons.home),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
];

class _MainActivityState extends State<MainActivity> {
  CustomPopupMenu _selectedChoices = choices[0];

  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Popup Menu Button Sample'),
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            elevation: 3.2,
            initialValue: choices[0],
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return Container(
      child: SelectedOption(choice: _selectedChoices),
    );
  }
}

class SelectedOption extends StatelessWidget {
  CustomPopupMenu choice;

  SelectedOption({Key key, this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 140.0, color: Colors.white),
            Text(
              choice.title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
