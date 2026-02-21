import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

/// A white card container with a title label and content.
///
/// Used in Banking & Govt service screens to group related service items.
///
/// Usage:
/// ```dart
/// ServiceSectionCard(
///   title: 'Accounts',
///   child: ServiceGridRow(items: [...]),
/// )
/// ```
class ServiceSectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const ServiceSectionCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingMd),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty) ...[
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppColors.textMuted,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: AppDimensions.paddingMd),
          ],
          child,
        ],
      ),
    );
  }
}
