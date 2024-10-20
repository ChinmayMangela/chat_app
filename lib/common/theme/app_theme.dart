import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 225, 225, 225),
  colorScheme: ColorScheme.light(
    brightness: Brightness.light,
    primary: Colors.white,
    secondary: Colors.white.withOpacity(0.5),
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
