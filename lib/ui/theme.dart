import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() {
    loadTheme();
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void switchTheme(bool isDarkMode) async {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode);
    notifyListeners();
  }

  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkMode = prefs.getBool('isDarkMode');
    themeMode =
        isDarkMode == null || isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {
  static final darkTheme = ThemeData(
    textTheme:
        GoogleFonts.latoTextTheme(const TextTheme(headlineMedium: TextStyle())),
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );
}
