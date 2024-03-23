import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal_chat_app/themes/dark_mode.dart';
import 'package:minimal_chat_app/themes/light_mode.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeProvider());

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  //get the current theme data
  ThemeData get themeData => _themeData;
  //check for datk mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme data
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle the theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
