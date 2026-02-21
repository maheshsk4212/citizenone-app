import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/responsive.dart'; // Ensure this exists from previous steps

class AppTypography {
  // Base Font Sizes (per Antigravity Best Practices)
  static const double _baseDesktop = 16.0;
  static const double _baseMobile = 14.0;

  // -- Headings --

  /// H1: Page Titles (Desktop: 32px, Mobile: 24px)
  static TextStyle headlineLarge(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? 32 : 24,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
    height: 1.2,
  );

  /// H2: Section Headers (Desktop: 24px, Mobile: 20px)
  static TextStyle headlineMedium(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? 24 : 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
    height: 1.3,
  );

  /// H3: Card Titles (Desktop: 18px, Mobile: 16px)
  static TextStyle headlineSmall(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? 18 : 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1.4,
  );

  // -- Body Text --

  /// Body Large: Primary Content (Desktop: 16px, Mobile: 15px)
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? _baseDesktop : 15,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// Body Medium: Secondary Content / UI Labels (Desktop: 14px, Mobile: 14px)
  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  /// Caption: Small UI elements (Desktop: 12px, Mobile: 12px)
  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 0.2,
  );

  // -- Specialized Styles --

  /// Label Small: Badges, pills, tags (10-11px)
  static TextStyle labelSmall(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? 11 : 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textMuted,
    letterSpacing: 1.0,
    height: 1.2,
  );

  /// Hero Value: Large numbers on hero cards (Desktop: 48px, Mobile: 40px)
  static TextStyle heroValue(BuildContext context) => TextStyle(
    fontSize: ResponsiveLayout.isDesktop(context) ? 48 : 40,
    fontWeight: FontWeight.w800,
    color: Colors.white,
    height: 1.0,
  );

  /// Status Text: Inline status messages (13px)
  static TextStyle statusText(BuildContext context) => const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.4,
  );

  /// Section Header: Used by SectionHeader widget
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );
}
