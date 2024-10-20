import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 225, 225, 225),
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.white.withOpacity(0.5),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 225, 225, 225),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  iconTheme: const IconThemeData(
    color: Colors.grey,
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black54,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    secondary: Colors.grey.shade900.withOpacity(0.9),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.black54,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
    iconTheme: const IconThemeData(
      color: Colors.grey,
    )
);
