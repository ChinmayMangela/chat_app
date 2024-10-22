import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: const Color.fromARGB(255, 193, 192, 192),
    secondary: Colors.grey.shade100,
  ),
  appBarTheme: _getAppBarTheme(false),
  textTheme: GoogleFonts.latoTextTheme(),
  iconTheme: _getIconThemeData(),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    primary: Colors.black,
    secondary: Colors.grey.shade900.withOpacity(0.9),
  ),
  appBarTheme: _getAppBarTheme(true),
  textTheme: GoogleFonts.latoTextTheme(),
  iconTheme: _getIconThemeData(),
);

AppBarTheme _getAppBarTheme(bool isDarkMode) {
  return AppBarTheme(
    color:
        isDarkMode ? Colors.black54 : const Color.fromARGB(255, 225, 225, 225),
  );
}

IconThemeData _getIconThemeData() {
  return const IconThemeData(
    color: Colors.grey,
  );
}
