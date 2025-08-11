import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetTheme {
  // Cores aproximadas com base no layout proposto (mente/creme)
  static const Color primary = Color(0xFF8EDBD4); // mint
  static const Color primaryDark = Color(0xFF66C6BD);
  static const Color accent = Color(0xFF2C2C2C); // texto principal
  static const Color background = Color(0xFFF6F7F8); // fundo claro
  static const Color surface = Colors.white; // cards
  static const Color textSecondary = Color(0xFF6B7280);

  static ThemeData get lightTheme {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: primaryDark,
        surface: surface,
        background: background,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: accent,
        onBackground: accent,
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: accent,
        displayColor: accent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: accent,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: primary.withOpacity(0.15),
        selectedColor: primary,
        labelStyle: const TextStyle(color: accent),
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      cardTheme: CardTheme(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dividerColor: const Color(0xFFE5E7EB),
    );
  }

  // Tipos de texto auxiliares
  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: accent,
      );
  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: accent,
      );
  static TextStyle get body => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textSecondary,
      );
}

