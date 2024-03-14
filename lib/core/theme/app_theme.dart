import 'package:flutter/material.dart';
import 'package:workout_planner/core/constants/app_colors.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      background: Colors.white,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Colors.black,
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
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
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      fillColor: AppColors.lightSurface,
      filled: true,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      tileColor: AppColors.lightSurface,
    ),
  );
}
