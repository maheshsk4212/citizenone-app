import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/core/common/widgets/quick_action_button.dart';
import 'package:citizenone_app/core/common/widgets/service_list_tile.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

/// A reusable scaffold for mini-service screens.
///
/// Provides a consistent layout with:
/// - AppBar with title and back button
/// - Hero section (custom widget)
/// - Quick Actions row
/// - Services list
/// - Optional AI Insight card
///
/// Screens using this: HealthEzy, Insurance, Sport, etc.
class MiniServiceScaffold extends StatelessWidget {
  final String title;
  final Widget hero;
  final List<QuickActionData> quickActions;
  final List<ServiceListData> services;
  final Widget? aiInsight;

  const MiniServiceScaffold({
    super.key,
    required this.title,
    required this.hero,
    required this.quickActions,
    required this.services,
    this.aiInsight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), // gray-50
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.go('/home'),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(color: Colors.grey[200], height: 1)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero Section
            hero,
            SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // Quick Actions
            const Text(
              'QUICK ACTIONS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: AppDimensions.headerToContentSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: quickActions
                  .map((action) => QuickActionButton.fromData(
                        icon: action.icon,
                        label: action.label,
                        color: action.color,
                        backgroundColor: action.backgroundColor,
                        iconColor: action.iconColor,
                        onTap: action.onTap,
                        style: QuickActionStyle.circle,
                      ))
                  .toList(),
            ),
            SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // Services List
            const Text(
              'SERVICES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: AppDimensions.headerToContentSpacing),
            ...services.map((service) => ServiceListTile(
                  title: service.title,
                  onTap: service.onTap,
                )),

            // AI Insight (Optional)
            if (aiInsight != null) ...[
              SizedBox(height: AppDimensions.sectionVerticalSpacing),
              Row(
                children: [
                  const Icon(LucideIcons.sparkles,
                      size: 16, color: Color(0xFFF97316)),
                  const SizedBox(width: 6),
                  const Text(
                    'AI ASSISTANTS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              aiInsight!,
            ],

            const SizedBox(height: AppDimensions.scrollBottomPadding),
          ],
        ),
      ),
    );
  }
}

// ── Data Models ──
// These replace the old QuickActionItem and ServiceListItem classes
// that were defined inside this file.

/// Data model for quick action items in [MiniServiceScaffold].
class QuickActionData {
  final IconData icon;
  final String label;
  final Color? color;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  QuickActionData({
    required this.icon,
    required this.label,
    this.color,
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });
}

/// Data model for service list items in [MiniServiceScaffold].
class ServiceListData {
  final String title;
  final VoidCallback? onTap;

  ServiceListData({required this.title, this.onTap});
}
