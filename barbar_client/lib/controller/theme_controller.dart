import 'package:flutter/material.dart';

class ThemeController {
  static final Color baseColor = const Color.fromARGB(255, 0, 106, 103);
  static final Color amber = Color(0xFFFFA726);
  static final Color blue = Colors.blue;
  static final Color green = Colors.green;
  static final Color lightGreen = const Color.fromARGB(255, 2, 255, 10);
  static final Color red = Colors.red;

  static final FilledButtonThemeData _filledButtonThemeData =
      FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: baseColor,
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey.withAlpha(120),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final inputBorders = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.grey),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: inputBorders,
    enabledBorder: inputBorders,
    focusedBorder: inputBorders,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: red),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: baseColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: baseColor,
      secondary: Colors.white,
    ),
    filledButtonTheme: _filledButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: baseColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: baseColor,
      secondary: Colors.white,
    ),
    filledButtonTheme: _filledButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
  );
}
