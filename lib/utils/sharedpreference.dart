import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSingleton {
  SharedPreferencesSingleton._privateConstructor();

  static final SharedPreferencesSingleton _instance =
      SharedPreferencesSingleton._privateConstructor();
  static SharedPreferences? _prefs;

  factory SharedPreferencesSingleton() {
    return _instance;
  }

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized");
    }
    return _prefs!.getString(key);
  }

  void setString(String key, String value) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized");
    }
    await _prefs!.setString(key, value);
  }

  void removeValue(String key) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized");
    }
    await _prefs!.remove(key);
  }
}
