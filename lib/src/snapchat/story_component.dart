
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/snapchat/common_widgets.dart';

class StoryComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StoryState();
}

class StoryState extends State<StoryComponent> {
  @override
  Widget build(BuildContext context) {
    //AppState.updateStatusBarBackground(Colors.purple);
    return Scaffold(
      appBar: MyAppBar(
        avatarUrl: "https://image.thanhnien.vn/w660/Uploaded/2022/wpdhnwejw/2021_08_01/pastedimage0_vyoh.jpg",
        title: "Stories",
        rightIcon: Icons.add_circle_outline,
        background: Colors.purple,
      ),
    );
  }
}