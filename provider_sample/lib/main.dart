import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ChangeNotifierProvider<CounterModel>(
        builder: (_) => CounterModel(),
        child: CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Sample'),
      ),
      body: Center(
        child: Text(
          'Counter Value is: ${counterModel.getCounter()}',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterModel.incrementCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 30),
          FloatingActionButton(
            onPressed: () => counterModel.decrementCounter(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterModel with ChangeNotifier {
  int _counter = 0;

  getCounter() => _counter;

  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
