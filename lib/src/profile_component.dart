import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'default_localizations.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfileComponent> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(DefaultLocalizations.of(context)?.getStringResource('hello') ?? 'Blank or null')),
        body: Text('Counter is $counter'),
        floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.add), onPressed: () {
          setState(() {
            counter++;
          });
        }));
  }

}