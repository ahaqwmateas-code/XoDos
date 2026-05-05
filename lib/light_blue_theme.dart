// light_blue_theme.dart
import 'package:flutter/material.dart';

class LightBlueTheme {
  static const Color primaryBlue = Color(0xFF00B4D8);
  static const Color accentBlue = Color(0xFF0096C7);
  static const Color darkBg = Color(0xFF0A1628);
  static const Color cardBg = Color(0xFF1A2B3D);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF90E0EF);

  static ThemeData getTheme(bool isDark) {
    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: darkBg,
      appBarTheme: AppBarTheme(
        backgroundColor: cardBg,
        foregroundColor: primaryBlue,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: cardBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: primaryBlue, width: 0.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: darkBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: primaryBlue,
        secondary: accentBlue,
        surface: cardBg,
        background: darkBg,
      ),
    );
  }
}
