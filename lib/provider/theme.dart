import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final String key = "theme";
  SharedPreferences prefs;
  bool _darktheme;

  bool get darktheme => _darktheme;

  //Constructor para el tema
  ThemeData _themeData;
  ThemeProvider() {
    this._themeData;
    _darktheme = true;
    loadPreferences();
  }

  toogleTheme() {
    _darktheme = !_darktheme;
    savePreferences();
    notifyListeners();
  }

  _initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  loadPreferences() async {
    await _initPrefs();
    _darktheme = prefs.getBool(key) ?? true;
    notifyListeners();
  }

  savePreferences() async {
    await _initPrefs();
    prefs.setBool(key, _darktheme);
  }

  getTheme() => _themeData;
}
