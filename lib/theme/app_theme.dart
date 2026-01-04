import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFF6F7FB);
  static const card = Colors.white;
  static const textPrimary = Color(0xFF111827);
  static const textSecondary = Color(0xFF6B7280);
  static const border = Color(0x1A000000); 
}

class AppRadii {
  static const card = 14.0;     
  static const pill = 999.0;    
}

class AppShadows {
  static const soft = [
    BoxShadow(
      color: Color(0x14000000), 
      blurRadius: 18,
      offset: Offset(0, 8),
    ),
  ];
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: null, 
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        borderSide: BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
      ),
    ),
  );
}