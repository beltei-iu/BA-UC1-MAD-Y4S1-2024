
import 'package:flutter/material.dart';
import 'package:mad2/screens/account_screen.dart';
import 'package:mad2/screens/add_news_screen.dart';
import 'package:mad2/screens/language_page.dart';
import 'package:mad2/screens/login_screen.dart';
import 'package:mad2/screens/main_screen.dart';
import 'package:mad2/screens/news_screen.dart';
import 'package:mad2/screens/register_screen.dart';
import 'package:mad2/screens/splash_screen.dart';

class RouteGenerator {

  static const String splashScreen = "/";
  static const String mainScreen = "/mainScreen";
  static const String languageScreen = "/languageScreen";
  static const String registerScreen = "/registerScreen";
  static const String loginScreen = "/loginScreen";
  static const String accountScreen = "/accountScreen";
  static const String newsScreen = "/newsScreen";
  static const String addNewsScreen = "/addNewsScreen";

  RouteGenerator._(){}

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:
          return _createRoute(SplashScreen(), settings);
      case mainScreen:
          return _createRoute(MainScreen(), settings);
      case languageScreen:
        return _createRoute(LanguagePage(), settings);
      case loginScreen:
        return _createRoute(LoginScreen(), settings);
      case registerScreen:
        return _createRoute(RegisterScreen(), settings);
      case accountScreen:
        return _createRoute(AccountScreen(), settings);
      case newsScreen:
        return _createRoute(NewsScreen(), settings);
      case addNewsScreen:
        return _createRoute(AddNewsScreen(), settings);
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