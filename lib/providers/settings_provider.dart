import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  late SharedPreferences _prefs;
  late Locale _locale;
  Locale get locale => _locale;

  final List<MapEntry<Locale, AppLocalizations>> _appLocalizationsEntryList =
      [];
  List<MapEntry<Locale, AppLocalizations>> get appLocalizationsEntryList =>
      _appLocalizationsEntryList;

  SettingsProvider() {
    _locale = AppLocalizations.supportedLocales.first;
    setSharedPreferences();
    _setLocalizations();
  }

  Future<void> setSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    String? localeCode = _prefs.getString("locale");
    print(localeCode);
    if (localeCode != null) {
      _locale = Locale(localeCode);
      notifyListeners();
    }
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
    _prefs.setString("locale", locale.toLanguageTag());
    notifyListeners();
  }
}
