import 'package:flutter/material.dart';
import 'package:mad2/localization/app_localization.dart';
import 'package:mad2/provider/language_provider.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  @override
  Widget build(BuildContext context) {

      final languageProvider = Provider.of<LanguageProvider>(context);
      final locale = languageProvider.appLocal;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context)!.translate(LocKey.language.name)),
        elevation: 5,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(AppLocalization.of(context)!.translate(LocKey.khmerLanguage.name)),
              trailing: Checkbox(value: locale.languageCode == "km", onChanged: (v){
                  final provider = Provider.of<LanguageProvider>(context, listen: false);
                  provider.changeLanguage(Locale("km"));
              }),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.language),
              title: Text(AppLocalization.of(context)!.translate(LocKey.englishLanguage.name)),
              trailing: Checkbox(value: locale.languageCode != "km", onChanged: (v){
                  final provider = Provider.of<LanguageProvider>(context, listen: false);
                  provider.changeLanguage(Locale("en"));
              }),
            ),
          )
        ],
      ),
    );
  }
}
