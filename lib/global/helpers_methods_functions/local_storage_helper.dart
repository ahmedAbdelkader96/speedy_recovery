import 'package:shared_preferences/shared_preferences.dart';



class LocalStorageHelper {

  static Future<void> addInt(String key, int value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storageValue = sharedPreferences.getInt(key);
    return storageValue;

  }



  static Future<void> addString(String key, String value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }


  static Future<String?> getString(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storageValue = sharedPreferences.getString(key);
    return storageValue;
  }

  static Future<void> setBool(String key, bool value) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final storageValue = sharedPreferences.getBool(key);
    return storageValue;
  }


}
