import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// A styled list tile for service items.
///
/// Used in Agri, SME, Logistics, Marketplace, and MiniServiceScaffold screens.
///
/// Usage:
/// ```dart
/// ServiceListTile(
///   title: 'Crop Advisory Services',
///   icon: LucideIcons.arrow_up_right,
///   onTap: () {},
/// )
/// ```
class ServiceListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const ServiceListTile({
    super.key,
    required this.title,
    this.icon = LucideIcons.arrow_up_right,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimensions.paddingSm),
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingLg, vertical: AppDimensions.paddingMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 18, color: Colors.grey[400]),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
