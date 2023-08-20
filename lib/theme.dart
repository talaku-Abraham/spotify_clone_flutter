import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData().copyWith(color: Colors.white),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.black,
    // const Color(0xFF121212),
    fontFamily: 'Montserrat',
    colorScheme: const ColorScheme.dark(
      primary: Colors.black,
      background: Colors.red,
      // Color(0xFF121212),
    ),
    textTheme: TextTheme(
      //heading 2
      displayMedium: const TextStyle(
          color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
      //heading 4
      headlineMedium: TextStyle(
          color: Colors.grey[300],
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0),
      //bodytext1
      bodyLarge: TextStyle(
          color: Colors.grey[300], fontSize: 14.0, letterSpacing: 1.0),
      // bodyText2
      bodyMedium: TextStyle(color: Colors.grey[300], letterSpacing: 1.0),
    ),
  );
}
