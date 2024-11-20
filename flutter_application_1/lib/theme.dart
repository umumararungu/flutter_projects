import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColorLight = Colors.blue;
  static const Color primaryColorDark = Colors.deepPurple;

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColorLight,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    brightness: Brightness.dark,
  );
}
