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
import 'package:citizenone_app/features/dashboard/presentation/screens/partner_selection_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/agent_task_alert.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/agent_insights.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/bank_partner_card.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/partner_services_grid.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/insurance_services_grid.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/widgets/mno_services_grid.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/features/dashboard/domain/entities/service_entity.dart';
import 'package:go_router/go_router.dart';

import 'package:citizenone_app/core/design_system/responsive.dart';

class SuperHomeScreen extends ConsumerWidget {
  const SuperHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final role = authState.selectedRole;
    final workContext = authState.workContext; 
    final services = ref.watch(servicesProvider);
    
    double horizontalPadding = ResponsiveLayout.isDesktop(context) ? 64 : 20;

    if (workContext == 'Partner' && authState.selectedPartner == null) { // Show selection if no partner picked
      return const PartnerSelectionScreen();
    }

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: ResponsiveLayout.isDesktop(context)
                ? Column(
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: HeroCard(role: role),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SectionHeader(title: 'Quick Actions'),
                                const SizedBox(height: 16),
                                QuickActions(role: role),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      if (role == UserRole.agent && authState.selectedPartner != null && workContext == 'Partner') ...[
                        BankPartnerCard(
                          partnerName: authState.selectedPartner!,
                          partnerIcon: authState.partnerIcon ?? LucideIcons.landmark,
                          partnerType: authState.partnerType,
                          onSwitch: () => ref.read(authProvider.notifier).clearPartner(),
                        ),
                      ] else ...[
                        HeroCard(role: role),
                      ],
                      if (role == UserRole.agent && authState.selectedPartner == null) ...[
                        const SizedBox(height: 16),
                        const AgentTaskAlert(),
                      ],
                    ],
                  ),
          ),
        ),
        
        if (role == UserRole.agent && authState.selectedPartner != null && workContext == 'Partner') ...[
           // Partner-specific services based on type
           SliverToBoxAdapter(
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 32),
               child: authState.partnerType == 'Bank' 
                 ? const PartnerServicesGrid()
                 : authState.partnerType == 'Insurance'
                   ? const InsuranceServicesGrid()
                   : authState.partnerType == 'MNO'
                     ? const MnoServicesGrid()
                     : const PartnerServicesGrid(), // Default to bank services
             ),
           ),
        ] else if (!ResponsiveLayout.isDesktop(context)) ...[
          const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.sectionVerticalSpacing)),
          
          // Quick Actions Section (Mobile only here, Desktop has it in the Hero Row)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const SectionHeader(title: 'Quick Actions'),
            ),
          ),
          
          SliverToBoxAdapter(child: SizedBox(height: AppDimensions.headerToContentSpacing)),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: QuickActions(role: role),
            ),
          ),
        ],

        // Services section (Desktop starts here in slivers, Mobile continues)
        SliverToBoxAdapter(child: SizedBox(height: ResponsiveLayout.isDesktop(context) ? 48 : AppDimensions.sectionVerticalSpacing)),
        
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
          
          SliverToBoxAdapter(child: SizedBox(height: ResponsiveLayout.isDesktop(context) ? 16 : AppDimensions.headerToContentSpacing)),
          
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
                maxCrossAxisExtent: ResponsiveLayout.isDesktop(context) ? 200 : 110,
                mainAxisSpacing: ResponsiveLayout.isDesktop(context) ? 32 : 24,
                crossAxisSpacing: 16,
                mainAxisExtent: ResponsiveLayout.isDesktop(context) ? 160 : 110,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: ResponsiveLayout.isDesktop(context) ? 40 : AppDimensions.sectionVerticalSpacing)),
          
          if (role == UserRole.agent) ...[
             // Agent Insights
             SliverToBoxAdapter(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                 child: const AgentInsights(),
               ),
             ),
             SliverToBoxAdapter(child: SizedBox(height: ResponsiveLayout.isDesktop(context) ? 32 : AppDimensions.sectionVerticalSpacing)),
          ],

          
          // Recent Activity (Bottom)
          SliverToBoxAdapter(
             child: Padding(
               padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
               child: const RecentActivity(),
             ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppDimensions.scrollBottomPadding)), // Bottom padding
        ],
      );
  }
}
