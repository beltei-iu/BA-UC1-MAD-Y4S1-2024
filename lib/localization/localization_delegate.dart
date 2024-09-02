
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mad2/localization/app_localization.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {

  @override
  bool isSupported(Locale locale) {
    return ["en","km"].contains(locale.languageCode);
  }

  // Option 1
  // @override
  // Future<AppLocalization> load(Locale locale) =>
  //   SynchronousFuture<AppLocalization>(
  //       AppLocalization(locale)
  //   );

  // Option 2
  @override
  Future<AppLocalization> load(Locale locale) async{
      AppLocalization localization = AppLocalization(locale);
      await localization.load();
      return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}