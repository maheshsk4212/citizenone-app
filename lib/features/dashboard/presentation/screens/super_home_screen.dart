import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/features/dashboard/presentation/providers/services_provider.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/service_card.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/hero_card.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/quick_actions.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/ai_smart_section.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/weather_widget.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:go_router/go_router.dart';

import 'package:citizenone_app/core/design_system/responsive.dart';

class SuperHomeScreen extends ConsumerWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(authProvider).selectedRole;
    final services = ref.watch(servicesProvider);
    
    double horizontalPadding = ResponsiveLayout.isDesktop(context) ? 64 : 20;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                // Hero Card (Top - Bill Due)
                HeroCard(role: role),
                const SizedBox(height: 24),
                
                // Quick Actions
                QuickActions(role: role),
                const SizedBox(height: 32),
                
                // Services Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Services',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push('/services'),
                      child: const Row(
                        children: [
                          Text('View All', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ServiceCard(service: services[index]);
              },
              childCount: services.length,
            ),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100, // force compact width to fit ~4 on mobile
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8, // Taller to accommodate text
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        
        // AI Insights (Bottom)
        SliverToBoxAdapter(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Row(
                    children: [
                      Icon(LucideIcons.sparkles, size: 16, color: const Color(0xFF7C3AED)),
                      SizedBox(width: 8),
                      Text('CITIZEN AI INSIGHTS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF7C3AED), letterSpacing: 1.0)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AISmartSection(role: role),
               ],
             ),
           ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom padding
      ],
    );
  }

  Widget _buildPlaceholderRecentItem(String title, String subtitle, String amount, IconData icon, Color bg, Color iconColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: AppColors.shadowSm,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildRecentActivityList() {
    return Column(
      children: [
        _buildPlaceholderRecentItem('Grocery Store', 'Today, 10:30 AM', '-ZK 240.00', Icons.shopping_cart_outlined, const Color(0xFFFFEDD5), const Color(0xFFEA580C)),
        _buildPlaceholderRecentItem('City Power', 'Yesterday, 4:15 PM', '-ZK 450.00', Icons.electric_bolt_outlined, const Color(0xFFFEF9C3), const Color(0xFFCA8A04)),
        _buildPlaceholderRecentItem('Coffee Shop', 'Yesterday, 9:00 AM', '-ZK 55.00', Icons.coffee_outlined, const Color(0xFFEFEBE9), const Color(0xFF8D6E63)),
      ],
    );
  }
}
