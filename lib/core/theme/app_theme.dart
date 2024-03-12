import 'package:flutter/material.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.white,
      surface: Colors.black,
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 14,
          letterSpacing: 1.3,
        ),
        minimumSize: const Size.fromHeight(50),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      filled: true,
    ),
  );
}
