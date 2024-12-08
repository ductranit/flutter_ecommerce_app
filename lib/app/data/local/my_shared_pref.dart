import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _fcmTokenKey = 'fcm_token';
  static const String _lightThemeKey = 'is_theme_light';
  static const String _authTokenKey = 'auth_token';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ??
      true; // todo set the default theme (true for light, false for dark)

  /// save generated fcm token
  static Future<void> setFcmToken(String token) =>
      _sharedPreferences.setString(_fcmTokenKey, token);

  /// get generated fcm token
  static String? getFcmToken() => _sharedPreferences.getString(_fcmTokenKey);

  /// save auth token
  static Future<void> setAuthToken(String token) =>
      _sharedPreferences.setString(_authTokenKey, token);

  /// get auth token
  static String? getAuthToken() => _sharedPreferences.getString(_authTokenKey);

  static Future<void> removeAuthToken() =>
      _sharedPreferences.remove(_authTokenKey);

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();

  static String deviceId() {
    var id = _sharedPreferences.getString('device_id');
    if (id == null) {
      id = Uuid().v1();
      _sharedPreferences.setString('device_id', id);
    }
    return id;
  }
}
