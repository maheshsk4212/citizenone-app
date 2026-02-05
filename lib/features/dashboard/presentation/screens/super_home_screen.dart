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
import 'package:citizenone_app/features/dashboard/domain/entities/service_entity.dart';
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
            child: Align(
              alignment: Alignment.topLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      HeroCard(role: role),
                    ],
                ),
              ),
            ),
          ),
        ),
        
        const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.sectionVerticalSpacing)),
        
        // Quick Actions Section
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: const SectionHeader(title: 'Quick Actions'),
          ),
        ),
        
        const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.headerToContentSpacing)),
        
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: QuickActions(role: role),
          ),
        ),
        
        const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.sectionVerticalSpacing)),
        
        // Services Section
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SectionHeader(
              title: 'All Services',
              actionLabel: 'View All',
              onActionTap: () => context.push('/services'),
            ),
          ),
        ),
        
        const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.headerToContentSpacing)),
        
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ServiceCard(service: services[index]);
              },
              childCount: services.length,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 110,
              mainAxisSpacing: ResponsiveLayout.isDesktop(context) ? 16 : 4,
              crossAxisSpacing: 16,
              mainAxisExtent: 140,
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
