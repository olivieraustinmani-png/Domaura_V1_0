import 'package:flutter/material.dart';

class DomauraColors {
  static const Color navy = Color(0xFF0F172A);
  static const Color gold = Color(0xFFD4AF37);
  static const Color white = Color(0xFFF8FAFC);
  static const Color muted = Color(0xFF94A3B8);
  static const Color border = Color(0xFFE2E8F0);
}

class DomauraTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: DomauraColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: DomauraColors.navy,
        primary: DomauraColors.navy,
        secondary: DomauraColors.gold,
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: DomauraColors.navy,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.8,
        shadowColor: Colors.black.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: DomauraColors.border),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: DomauraColors.navy,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: DomauraColors.navy,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: DomauraColors.navy,
        ),
      ),
    );
  }
}

