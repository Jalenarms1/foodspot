import 'package:shared_preferences/shared_preferences.dart';

class LocalAuth {
  static String authKey = "xx_usrkeyfdspt";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(authKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(authKey);
  }

  static removeToken() {
    SharedPreferences.getInstance().then((pref) {
      pref.remove(authKey);
    });
  }
}
