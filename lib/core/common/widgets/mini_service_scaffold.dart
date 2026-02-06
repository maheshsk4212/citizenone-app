import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/hero_card.dart'; // Reusing for consistency, or pass custom
import 'package:flutter_lucide/flutter_lucide.dart';

class MiniServiceScaffold extends StatelessWidget {
  final String title;
  final Widget hero;
  final List<QuickActionItem> quickActions;
  final List<ServiceListItem> services;
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
            const SizedBox(height: 24),

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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: quickActions.map((action) => _buildQuickAction(action)).toList(),
            ),
            const SizedBox(height: 32),

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
            const SizedBox(height: 16),
            ...services.map((service) => _buildServiceItem(service)),

            // AI Insight (Optional)
            if (aiInsight != null) ...[
              const SizedBox(height: 32),
              const Row(
                children: [
                   Icon(LucideIcons.sparkles, size: 16, color: Color(0xFFF97316)),
                   SizedBox(width: 6),
                   Text(
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
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(QuickActionItem action) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: action.backgroundColor ?? action.color ?? AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            action.icon, 
            color: action.iconColor ?? Colors.white, 
            size: 24
          ),
        ),
        const SizedBox(height: 8),
        Text(
          action.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildServiceItem(ServiceListItem service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(LucideIcons.arrow_up_right, size: 18, color: AppColors.textSecondary),
        ),
        title: Text(
          service.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColors.textPrimary,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        onTap: service.onTap,
      ),
    );
  }
}

class QuickActionItem {
  final IconData icon;
  final String label;
  final Color? color; // Legacy support: used as background if backgroundColor not provided
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  QuickActionItem({
    required this.icon, 
    required this.label, 
    this.color, 
    this.backgroundColor,
    this.iconColor,
    this.onTap,
  });
}

class ServiceListItem {
  final String title;
  final VoidCallback? onTap;

  ServiceListItem({required this.title, this.onTap});
}
