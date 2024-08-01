import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_app/app/data/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  // GetStorage instance
  final box = GetStorage();
  late ThemeData _themeData;
  // Initially setting the theme based on stored value or default to light mode
  ThemeProvider() {
    bool isDarkMode = box.read("isDarkmode") ?? false;
    _themeData = isDarkMode ? darkMode : lightMode;
  }

  // Getter method to access the theme from other parts of the code
  ThemeData get themeData => _themeData;

  // Getter method to know if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  // Setter method to set new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // Toggle function to change the theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      box.write("isDarkmode", true);
    } else {
      themeData = lightMode;
      box.write("isDarkmode", false);
    }
  }
}
