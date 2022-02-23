// 1 import lib
// 2 create a class that will be our customized widget, this class must extend the Stateless Widget base class
// 3 define a build method that return the widget that this class will show

import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Hi')),
            body: Text('Counter is $counter'),
            floatingActionButton:
            FloatingActionButton(child: const Icon(Icons.add), onPressed: () {
              setState(() {
                counter++;
              });
            })));
  }
}