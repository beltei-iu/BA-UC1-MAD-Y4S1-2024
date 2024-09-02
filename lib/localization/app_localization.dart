
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

enum LocKey {
  hello,
  getStart,
  language,
  khmerLanguage,
  englishLanguage,
  home,
  classroom,
  more,
}

class AppLocalization {

  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext ctx) => Localizations.of<AppLocalization>(ctx, AppLocalization);

 // Option 1
  static Map<String, Map<String,String>> data = {
      "en":{
        "getStart":"Get Started",
        "language":"Langauge",
        "khmerLangauge":"Khmer Langauge",
        "englishLangauge":"English Langauge"
      },
      "km":{
        "getStart":"ចាប់ផ្តើម",
        "language":"ភាសារ",
        "khmerLangauge":"ភាសារខ្មែរ",
        "englishLangauge":"ភាសារអង់គ្លេស"
      }
  };

  Map<String,String>? _localizedStrings;
// Option 2
  Future<bool> load() async {
    // Load file from JSON
    String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key,value) => MapEntry(key, value.toString()));
    return true;
  }

  String translate(String key){
    // final languageCode = locale.languageCode;
    //return data[languageCode]?[key] ?? "";
    return _localizedStrings![key] ?? key;
  }

}