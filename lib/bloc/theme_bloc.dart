import 'package:flutter/material.dart';
import 'package:gdg_flutter_app/utils/themeprefs.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
     _darkTheme = value;
    themePrefs.setTheme(value);
    notifyListeners();
  }
}
