import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier{
  //Constructor para el tema
  ThemeData _themeData;
  ThemeProvider(this._themeData);


  getTheme() => _themeData;

  setTheme(ThemeData newtheme){
    _themeData = newtheme;
    notifyListeners();
  }
}