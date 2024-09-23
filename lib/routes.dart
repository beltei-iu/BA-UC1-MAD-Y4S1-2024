
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mad2/screens/language_page.dart';
import 'package:mad2/screens/login_screen.dart';
import 'package:mad2/screens/main_screen.dart';
import 'package:mad2/screens/register_screen.dart';
import 'package:mad2/screens/splash_screen.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String homePage = "/homePage";
  static const String languagePage = "/language";

  static const String registerScreen = "/registerScreen";
  static const String loginScreen = "/loginScreen";

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
      case loginScreen:
        return _createRoute(LoginScreen(), settings);
      case registerScreen:
        return _createRoute(RegisterScreen(), settings);
      default:
        throw RouteException("Route not found");
    }
  }

  static Route<dynamic> _createRoute(Widget newScreen, RouteSettings settings){
    return MaterialPageRoute(settings: settings, builder: (BuildContext context) => newScreen);
  }
}

class RouteException implements Exception {

  String message;

  RouteException(this.message);

}