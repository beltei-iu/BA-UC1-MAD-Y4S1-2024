import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mad2/localization/localization_delegate.dart';
import 'package:mad2/provider/language_provider.dart';
import 'package:mad2/routes.dart';
import 'package:mad2/screens/home_screen.dart';
import 'package:mad2/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LanguageProvider languageProvider = LanguageProvider();
  languageProvider.fetchLanguage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) {

        final language = Provider.of<LanguageProvider>(context);

        return MaterialApp(
            title: 'MAD',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF018AAA)),
                useMaterial3: false,
                primaryColor: const Color(0xFF018AAA)
            ),

            initialRoute: RouteGenerator.splashScreen,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: RouteGenerator.key,

            locale: language.appLocal,
            supportedLocales: [
              Locale("en","US"),
              Locale("km","KH")
            ],
            localizationsDelegates: [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
          debugShowCheckedModeBanner: false,
          );
      },
    );
    return provider;
  }
}