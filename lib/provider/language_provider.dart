
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {

  Locale _appLocal = Locale("en");

  Locale get appLocal => _appLocal;

  fetchLanguage() async{
    final pref = await SharedPreferences.getInstance();
    if(pref.getString("lang") == null){
      _appLocal = Locale("en");
      return _appLocal;
    }
    _appLocal = Locale(pref.getString("lang") ?? "en");
    return _appLocal;
  }

  void changeLanguage(Locale locale) async{
    final pref = await SharedPreferences.getInstance();
    if(locale == _appLocal){
      return;
    }
    if(locale == Locale("km")){
      _appLocal = Locale("km");
      await pref.setString("lang", "km");
    }else{
      _appLocal = Locale("en");
      await pref.setString("lang", "en");
    }
    notifyListeners();
  }
}