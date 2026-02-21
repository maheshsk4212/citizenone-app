import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/press_scale_widget.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';

/// A unified quick action button used across the app.
///
/// Two visual styles:
/// - [QuickActionStyle.roundedSquare] — Used on main dashboard & banking.
///   Rounded-rectangle icon box with a colored shadow.
/// - [QuickActionStyle.circle] — Used inside mini-service scaffolds.
///   Circular icon container, simpler look.
///
/// Usage:
/// ```dart
/// QuickActionButton(
///   icon: LucideIcons.wallet,
///   label: 'Wallet',
///   bgColor: Color(0xFFDBEAFE),
///   iconColor: Color(0xFF2563EB),
///   onTap: () {},
/// )
/// ```
enum QuickActionStyle { roundedSquare, circle }

class QuickActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final QuickActionStyle style;

  const QuickActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    this.onTap,
    this.style = QuickActionStyle.roundedSquare,
  });

  /// Convenience factory to create from the legacy MiniServiceScaffold data model.
  factory QuickActionButton.fromData({
    required IconData icon,
    required String label,
    Color? color,
    Color? backgroundColor,
    Color? iconColor,
    VoidCallback? onTap,
    QuickActionStyle style = QuickActionStyle.circle,
  }) {
    return QuickActionButton(
      icon: icon,
      label: label,
      bgColor: backgroundColor ?? color ?? AppColors.primary,
      iconColor: iconColor ?? Colors.white,
      onTap: onTap,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSquare = style == QuickActionStyle.roundedSquare;

    return PressScaleWidget(
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: isSquare ? AppDimensions.quickActionBoxSize : 56,
            height: isSquare ? AppDimensions.quickActionBoxSize : 56,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: isSquare ? BorderRadius.circular(AppDimensions.radiusMd) : null,
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              boxShadow: isSquare
                  ? [
                      BoxShadow(
                        color: iconColor.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      )
                    ]
                  : null,
            ),
            child: Icon(
              icon,
              size: isSquare ? AppDimensions.iconSize : AppDimensions.quickActionIconSize,
              color: iconColor,
            ),
          ),
          SizedBox(height: isSquare ? AppDimensions.iconToLabelGap : 8),
          SizedBox(
            width: AppDimensions.quickActionLabelWidth,
            child: Text(
              label,
              style: isSquare
                  ? AppTypography.caption(context).copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    )
                  : const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
