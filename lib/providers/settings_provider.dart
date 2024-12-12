import 'package:flutter/material.dart';
import 'package:repositoryviewer/utils/sharedpreference.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsProvider extends ChangeNotifier {
  Locale _locale =
      Locale(SharedPreferencesSingleton().getString("locale") ?? 'en');
  Locale get locale => _locale;

  final List<MapEntry<Locale, AppLocalizations>> _appLocalizationsEntryList =
      [];
  List<MapEntry<Locale, AppLocalizations>> get appLocalizationsEntryList =>
      _appLocalizationsEntryList;

  SettingsProvider() {
    _setLocalizations();
  }
  Future<void> _setLocalizations() async {
    for (Locale locale in AppLocalizations.supportedLocales) {
      AppLocalizations appLocalizations =
          await AppLocalizations.delegate.load(locale);
      appLocalizationsEntryList.add(MapEntry(locale, appLocalizations));
    }
  }

  void setLocale(Locale locale) {
    _locale = locale;
    SharedPreferencesSingleton().setString("locale", locale.toLanguageTag());
    notifyListeners();
  }
}
