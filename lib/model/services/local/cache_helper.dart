import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({required String key, required String data}) async {
    return await sharedPreferences.setString(key, data);
  }

  static String? getData({required String key}) {
    return sharedPreferences.getString(key);
  }

  static Future<bool> setLogged({required String key, required bool data}) {
    return sharedPreferences.setBool(key, data);
  }

  static bool? getLogged({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
