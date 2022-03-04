import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DefaultLocalizations {
  static DefaultLocalizations? of(BuildContext buildContext) {
    return Localizations.of<DefaultLocalizations>(buildContext, DefaultLocalizations);
  }
  String getStringResource(String key) => languages[key];
}

late GlobalMaterialLocalizations localizations;
late Map<String, dynamic> languages;

class DefaultLocalizationsDelegate extends LocalizationsDelegate<DefaultLocalizations> {
  // Languages that our app will support to display
  var supportedLanguages = ['en', 'vi'];
  @override
  bool isSupported(Locale locale) {
    return supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<DefaultLocalizations> load(Locale locale) async {
    // Each language will be stored in a json file and named by the language code
    String string = await rootBundle.loadString("assets/strings/${locale.languageCode}.json");
    languages = json.decode(string);
    return SynchronousFuture<DefaultLocalizations>(DefaultLocalizations());
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<DefaultLocalizations> old) => false;
  
}