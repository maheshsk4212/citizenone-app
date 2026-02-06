import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF2563EB); // Royal Blue
  static const Color primaryDark = Color(0xFF1E40AF);
  static const Color primaryLight = Color(0xFF60A5FA);

  // Accent
  static const Color accent = Color(0xFFF59E0B); // Amber/Gold
  static const Color accentGlow = Color(0x66F59E0B);

  // Backgrounds
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Colors.white;
  static const Color surfaceTranslucent = Color(0xE6FFFFFF); // 0.9 opacity
  static const Color surfaceLight = Color(0xFFF3F4F6);

  // Glass
  static const Color glass = Color(0xD9FFFFFF); // 0.85 opacity
  static const Color glassWhite = Color(0xD9FFFFFF); // Alias for compatibility
  static const Color glassBorder = Color(0x80FFFFFF); // 0.5 opacity

  // Text
  static const Color textPrimary = Color(0xFF111827);
  static const Color textMain = Color(0xFF111827); // Alias
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color textTertiary = Color(0xFF9CA3AF); // Alias for Muted

  // Status
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFFBBF24);
  
  // Legacy / Alias
  static const Color secondary = Color(0xFFF59E0B); // Alias for accent

  // Shadows
  static const List<BoxShadow> shadowSm = [
    BoxShadow(color: Color(0x0D000000), offset: Offset(0, 1), blurRadius: 2),
  ];
  static const List<BoxShadow> shadowMd = [
    BoxShadow(color: Color(0x1A000000), offset: Offset(0, 4), blurRadius: 6, spreadRadius: -1),
    BoxShadow(color: Color(0x0F000000), offset: Offset(0, 2), blurRadius: 4, spreadRadius: -1),
  ];
  static const List<BoxShadow> shadowGlow = [
    BoxShadow(color: Color(0x332563EB), blurRadius: 20, spreadRadius: 0),
  ];
}
