import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    secondary: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(
    labelSmall: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 40,
    )
  ),
  dividerColor: Colors.grey[400],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    )
  )
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xff121212),
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pinkAccent,
    secondary: Colors.grey[800],
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(
    labelSmall: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 40,
      color: Colors.white,
    )
  ),
  dividerColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      backgroundColor: WidgetStatePropertyAll(Colors.purple),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    )
  )
);
