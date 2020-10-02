import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  static const status = "status";

  setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(status, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(status) ?? false;
  }
}
