import 'package:flutter/material.dart';

class AppColors {
  // light mode
  static const Color primary = Color.fromARGB(255, 28, 25, 23);
  static const Color accent = Color.fromARGB(255, 184, 149, 90);
  static const Color accentPale = Color.fromARGB(255, 245, 238, 224);
  static const Color surface = Color.fromARGB(255, 255, 255, 255);
  static const Color background = Color.fromARGB(255, 237, 232, 223);
  static const Color mutedFG = Color.fromARGB(255, 120, 113, 108);
}

ThemeData get lightTheme => ThemeData(
  colorScheme: ColorScheme.light(
    surface: AppColors.background,
    primary: AppColors.primary,
    secondary: AppColors.accent,
    tertiary: AppColors.accentPale,
    inversePrimary: AppColors.surface,
    onSecondary: AppColors.mutedFG,
  ),
);

// TODO: change color when find dark color palet
ThemeData get darkTheme => ThemeData(
  colorScheme: ColorScheme.light(
    surface: AppColors.background,
    primary: AppColors.primary,
    secondary: AppColors.accent,
    tertiary: AppColors.accentPale,
    inversePrimary: AppColors.surface,
    onSecondary: AppColors.mutedFG,
  ),
);

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkTheme;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
  }
}
