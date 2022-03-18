import 'package:flutter/material.dart';

class DetailInboxComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetailInboxState();
}

class DetailInboxState extends State<DetailInboxComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Detail screen"),
      ),
    );
  }
}