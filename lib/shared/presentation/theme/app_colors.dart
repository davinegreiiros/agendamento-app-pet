import 'package:flutter/material.dart';

class AppColors {
  // Cores principais baseadas no design fornecido
  static const Color primary = Color(0xFFBFE9E5); // mint/verde claro
  static const Color primaryDark = Color(0xFF2F4A46); // verde escuro
  static const Color primaryBorder = Color(0xFFA5D9D3); // borda mint
  
  // Cores de fundo
  static const Color background = Color(0xFFF8F9FA); // fundo claro
  static const Color surface = Colors.white; // cards e superfícies
  
  // Cores de texto
  static const Color textPrimary = Color(0xFF2C2C2C); // texto principal
  static const Color textSecondary = Color(0xFF6B7280); // texto secundário
  static const Color textHint = Color(0xFF9E9E9E); // placeholder
  
  // Cores de estado
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Cores neutras
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);
  
  // Cores específicas para botões
  static const Color buttonSecondary = Color(0xFFBDBDBD);
  
  // Cores de divisores
  static const Color divider = Color(0xFFE5E7EB);
  
  // Cores de redes sociais
  static const Color google = Color(0xFF4285F4);
  static const Color facebook = Color(0xFF1877F2);
  
  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Sombras
  static List<BoxShadow> get defaultShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 18,
      offset: const Offset(0, 10),
      spreadRadius: 1,
    ),
  ];
  
  static List<BoxShadow> get lightShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 8,
      offset: const Offset(0, 4),
      spreadRadius: 0,
    ),
  ];
}
