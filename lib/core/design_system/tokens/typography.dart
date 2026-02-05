import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class AppTypography {
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );

  static const TextStyle gridItemLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500, // Consistent Medium weight
    color: AppColors.textPrimary,
  );
}
