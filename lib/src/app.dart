// 1 import lib
// 2 create a class that will be our customized widget, this class must extend the Stateless Widget base class
// 3 define a build method that return the widget that this class will show

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/src/default_localizations.dart';
import 'package:flutter_sample/src/snapchat/chat_component.dart';
import 'package:flutter_sample/src/snapchat/story_component.dart';

/* The highest parent UI, every screen should be put in a separated file
*  We might need a context for initializing variables in each screen, so this context will be helpful */
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int selectedIndex = 0;

  List<Widget> pages = <Widget>[
    ChatComponent(),
    StoryComponent()
  ];

  void onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    switch (index) {
      case 0:
        //updateStatusBarBackground(Colors.blue);
        break;
      case 1:
        //updateStatusBarBackground(Colors.purple);
        break;
    }
  }

  static void updateStatusBarBackground(Color color) => SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: color
      )
  );

  @override
  Widget build(context) {
    return MaterialApp(
        // Forced language
        locale: const Locale('en'),
        localizationsDelegates: [DefaultLocalizationsDelegate(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        supportedLocales: const [Locale('en', ''), Locale('vi', '')],
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: null,
          body: IndexedStack(
            index: selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Camera',
              ),
            ],
            currentIndex: selectedIndex,
            onTap: onBottomNavTap,
            elevation: 0,
            selectedIconTheme: const IconThemeData(color: Colors.blue, size: 30),
            //selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        )
    );
  }
}
