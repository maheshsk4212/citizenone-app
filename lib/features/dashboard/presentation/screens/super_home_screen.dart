import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/core/common/widgets/section_header.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/features/dashboard/presentation/providers/services_provider.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/service_card.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/hero_card.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/quick_actions.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/recent_activity.dart';
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
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20), // Explicit top spacing to replace padding
                // Hero Card (Top - Bill Due)
                HeroCard(role: role),
                const SizedBox(height: AppDimensions.sectionVerticalSpacing),
                
                // Quick Actions
                QuickActions(role: role),
                const SizedBox(height: AppDimensions.sectionVerticalSpacing),
                
                // Services Title
                SectionHeader(
                  title: 'All Services',
                  actionLabel: 'View All',
                  onActionTap: () => context.push('/services'),
                ),
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
              mainAxisExtent: 160, // Fixed height to guarantee no overflow regardless of width
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.sectionVerticalSpacing)),
        
        // Recent Activity (Bottom)
        SliverToBoxAdapter(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
             child: const RecentActivity(),
           ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom padding
      ],
    );
  }


}
