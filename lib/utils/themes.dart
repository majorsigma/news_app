import 'package:flutter/material.dart';

class ThemeStyle {

  // Light theme
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Lato",
    primaryColor: Colors.white,
    canvasColor: Colors.white,
    accentColor: Color(0xFFE44F50)
  );

  // Dark theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
  );
}
