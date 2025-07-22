import 'package:flutter/material.dart';

class ThemeController {
  static final Color baseColor = const Color.fromARGB(255, 0, 106, 103);

  static final FilledButtonThemeData _filledButtonThemeData =
      FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: baseColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: baseColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: baseColor,
      secondary: Colors.white,
    ),
    filledButtonTheme: _filledButtonThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: baseColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: baseColor,
      secondary: Colors.white,
    ),
    filledButtonTheme: _filledButtonThemeData,
  );
}
