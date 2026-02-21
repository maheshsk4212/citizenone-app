import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/common/widgets/section_header.dart';
import 'package:citizenone_app/core/common/widgets/quick_action_button.dart';
import 'package:citizenone_app/core/common/widgets/service_list_tile.dart';
import 'package:citizenone_app/core/design_system/responsive.dart';

class MarketplaceServiceScreen extends StatelessWidget {
  const MarketplaceServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = ResponsiveLayout.isDesktop(context) ? 64 : 20;
    const pinkColor = Color(0xFFDB2777); // Pink-600

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        foregroundColor: Colors.black,
      ),
      body: CustomScrollView(
        slivers: [
          // Hero Section - Sales Stats
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: pinkColor,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: pinkColor.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ZK 4,820.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Sales Today',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Divider(color: Colors.white.withOpacity(0.2)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Text(
                            '12 Orders Pending',
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                         ),
                         InkWell(
                           onTap: () {},
                           child: const Row(
                             children: [
                               Text(
                                'View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                               ),
                               Icon(Icons.chevron_right, color: Colors.white, size: 16),
                             ],
                           ),
                         )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Quick Actions
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const SectionHeader(title: 'Quick Actions'),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QuickActionButton(
                    label: 'List Item',
                    icon: LucideIcons.package_plus,
                    bgColor: const Color(0xFFFCE7F3),
                    iconColor: pinkColor,
                  ),
                  QuickActionButton(
                    label: 'Orders',
                    icon: LucideIcons.list_ordered,
                    bgColor: const Color(0xFFEFF6FF),
                    iconColor: const Color(0xFF2563EB),
                  ),
                  QuickActionButton(
                    label: 'Logistics',
                    icon: LucideIcons.truck,
                    bgColor: const Color(0xFFFFF7ED),
                    iconColor: const Color(0xFFEA580C),
                  ),
                  QuickActionButton(
                    label: 'My Store',
                    icon: LucideIcons.store,
                    bgColor: const Color(0xFFF3F4F6),
                    iconColor: const Color(0xFF4B5563),
                  ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // Services List
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const SectionHeader(title: 'Services'),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  ServiceListTile(title: 'Product Catalog'),
                  ServiceListTile(title: 'Customer Reviews'),
                  ServiceListTile(title: 'Seller Support'),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // AI Assistants
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  const Icon(LucideIcons.sparkles, size: 16, color: Color(0xFFE11D48)), // Red-600
                  const SizedBox(width: 8),
                  Text(
                    'AI ASSISTANTS',
                    style: TextStyle(
                      color: const Color(0xFFE11D48),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                         Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE4E6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(LucideIcons.sparkles, size: 12, color: Color(0xFFE11D48)),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'CITIZEN AI ALERT',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Demand Forecast',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Stock up on "Organic Rice". High demand expected this weekend.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                         style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE11D48), // Red/Pink
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('View Details', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
          
          const SliverToBoxAdapter(child: SizedBox(height: 48)),
        ],
      ),
    );
  }

}
