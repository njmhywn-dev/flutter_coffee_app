import 'package:flutter/material.dart';
import 'package:flutter_coffee_firebase/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier{
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme (bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}