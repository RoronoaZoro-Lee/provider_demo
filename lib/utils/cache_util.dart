import 'package:shared_preferences/shared_preferences.dart';

class CacheUtil {
  static CacheUtil _cacheUtil;

  CacheUtil._();

  factory CacheUtil() => _cacheUtil ??= CacheUtil._();

  SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key);
  }

  void remove(String key) {
    _prefs.remove(key);
  }
}
