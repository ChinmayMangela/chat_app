import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.white,
    primaryContainer: Colors.black,
    secondary: Colors.grey.shade100,
  ),
  appBarTheme: _getAppBarTheme(false),
  textTheme: GoogleFonts.latoTextTheme(),
  iconTheme: _getIconThemeData(),
  bottomNavigationBarTheme: _getBottomNavigationBarTheme(false),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    primary: Colors.black,
    primaryContainer: Colors.white,
    secondary: Colors.grey.shade900.withOpacity(0.9),
  ),
  appBarTheme: _getAppBarTheme(true),
  textTheme: GoogleFonts.latoTextTheme(),
  iconTheme: _getIconThemeData(),
  bottomNavigationBarTheme: _getBottomNavigationBarTheme(true),
);

AppBarTheme _getAppBarTheme(bool isDarkMode) {
  return AppBarTheme(
    color:
        isDarkMode ? Colors.black54 : Colors.white,
  );
}

IconThemeData _getIconThemeData() {
  return const IconThemeData(
    color: Colors.grey,
  );
}

BottomNavigationBarThemeData _getBottomNavigationBarTheme(bool isDarkMode) {
  return BottomNavigationBarThemeData(
    backgroundColor: isDarkMode ? Colors.white : Colors.black,
    selectedItemColor: isDarkMode ? Colors.black : Colors.white,
    unselectedItemColor: Colors.grey,
  );
}
