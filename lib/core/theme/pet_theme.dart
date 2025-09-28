import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Cores aproximadas com base no layout proposto (mente/creme)
const Color petPrimary = Color(0xFF8EDBD4); // mint
const Color petPrimaryDark = Color(0xFF66C6BD);
const Color petAccent = Color(0xFF2C2C2C); // texto principal
const Color petBackground = Color(0xFFF6F7F8); // fundo claro
const Color petSurface = Colors.white; // cards
const Color petTextSecondary = Color(0xFF6B7280);

ThemeData get petLightTheme => ThemeData.light(
      useMaterial3: false,
    ).copyWith(
      primaryColor: petPrimary,
      scaffoldBackgroundColor: petBackground,
      colorScheme: const ColorScheme.light(
        primary: petPrimary,
        secondary: petPrimaryDark,
        onSecondary: Colors.white,
        onSurface: petAccent,
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: petAccent,
        displayColor: petAccent,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: petAccent,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: petPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: petPrimary.withValues(alpha: 0.15),
        selectedColor: petPrimary,
        labelStyle: const TextStyle(color: petAccent),
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      cardTheme: CardThemeData(
        color: petSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      dividerColor: const Color(0xFFE5E7EB),
    );

// Tipos de texto auxiliares
TextStyle get petTitleLarge => GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: petAccent,
    );
TextStyle get petTitleMedium => GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: petAccent,
    );
TextStyle get petBody => GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: petTextSecondary,
    );
