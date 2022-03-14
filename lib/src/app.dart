// 1 import lib
// 2 create a class that will be our customized widget, this class must extend the Stateless Widget base class
// 3 define a build method that return the widget that this class will show

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/src/default_localizations.dart';
import 'package:flutter_sample/src/profile_component.dart';

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
  @override
  Widget build(context) {
    return MaterialApp(
        // Forced language
        locale: const Locale('en'),
        localizationsDelegates: [DefaultLocalizationsDelegate(), GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        supportedLocales: const [Locale('en', ''), Locale('vi', '')],
        home: const ProfileComponent());
  }
}
