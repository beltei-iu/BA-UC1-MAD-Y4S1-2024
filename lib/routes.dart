
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mad2/screens/language_page.dart';
import 'package:mad2/screens/main_screen.dart';
import 'package:mad2/screens/splash_screen.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String homePage = "/homePage";
  static const String languagePage = "/language";

  RouteGenerator._(){}

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
          final route = MaterialPageRoute(builder: (BuildContext context) => SplashScreen());
          return route;
      case homePage:
          final route = MaterialPageRoute(builder: (BuildContext context) => MainScreen());
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