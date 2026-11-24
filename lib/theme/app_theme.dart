import 'package:flutter/material.dart';

/// Thème global de LocalSwap (Partie B, question 4).
class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF2E7D6B); // vert LocalSwap
  static const Color accent = Color(0xFFFF8A3D); // orange (badges, FAB)

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      secondary: accent,
    ),
    scaffoldBackgroundColor: const Color(0xFFF6F8F7),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      centerTitle: false,
      elevation: 2,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: accent,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontWeight: FontWeight.w600),
    ),
  );
}
