import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      
      // Text Theme using Google Fonts (Inter) - Disabled for debug
      // textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme).copyWith(
      //   displayLarge: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
      //   displayMedium: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
      //   bodyLarge: const TextStyle(color: AppColors.textPrimary),
      //   bodyMedium: const TextStyle(color: AppColors.textSecondary),
      // ),
      
      // Fallback
       textTheme: ThemeData.light().textTheme.copyWith(
        displayLarge: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        displayMedium: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
        bodyLarge: const TextStyle(color: AppColors.textPrimary),
        bodyMedium: const TextStyle(color: AppColors.textSecondary),
       ),

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: AppColors.textPrimary,
        background: AppColors.background,
      ),

      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent, // Glass effect usually handled by container
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0, // Using manual shadows conform to tokens
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.zero,
      ),
      
      // Icon Theme
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),
    );
  }
}
