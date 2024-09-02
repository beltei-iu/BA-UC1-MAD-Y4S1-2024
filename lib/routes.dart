
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad2/screens/language_page.dart';
import 'package:mad2/screens/main_page.dart';
import 'package:mad2/screens/random_page.dart';
import 'package:mad2/screens/splash_screen.dart';
import 'package:mad2/screens/animation_screen.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String homePage = "/homePage";
  static const String randomPage = "/random";
  static const String languagePage = "/language";

  RouteGenerator._(){}

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
          final route = MaterialPageRoute(builder: (BuildContext context) => SplashScreen());
          return route;
      case homePage:
          final route = MaterialPageRoute(builder: (BuildContext context) => MainPage());
          return route;
      case randomPage:
        final route = MaterialPageRoute(builder: (BuildContext context) => RandomPage());
        return route;
      case languagePage:
        final route = MaterialPageRoute(builder: (BuildContext context) => LanguagePage());
        return route;
      default:
        throw RouteException("Route not found");
    }
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);

}