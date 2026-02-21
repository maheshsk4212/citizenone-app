import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/common/widgets/section_header.dart';
import 'package:citizenone_app/core/common/widgets/quick_action_button.dart';
import 'package:citizenone_app/core/common/widgets/service_list_tile.dart';
import 'package:citizenone_app/core/design_system/responsive.dart';

class LogisticsServiceScreen extends StatelessWidget {
  const LogisticsServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = ResponsiveLayout.isDesktop(context) ? 64 : 20;
    const orangeColor = Color(0xFFEA580C); // Orange-600

    return Scaffold(
      appBar: AppBar(
        title: const Text('Logistics', style: TextStyle(fontWeight: FontWeight.bold)),
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
          // Hero Section - Active Shipments
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: orangeColor, // Orange background
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage("https://ui-avatars.com/api/?name=L&background=random&color=fff"), // Placeholder or use pattern if available
                    // Actually let's avoid network image if not sure. 
                    // Screenshot shows a potential subtle pattern or just flat color.
                    // I will remove image to be safe.
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: orangeColor.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(LucideIcons.truck, color: Colors.white, size: 24),
                        ),
                      ],
                    ),
                    const Text(
                      'Active Shipments',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Status alert bar inside card
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF84CC16), // Lime green dot
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Next delivery expected by 4 PM today',
                              style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: orangeColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Track All Shipments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
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
                    label: 'Book Now',
                    icon: LucideIcons.truck,
                    bgColor: const Color(0xFFFEF3C7),
                    iconColor: const Color(0xFFD97706),
                  ),
                  QuickActionButton(
                    label: 'Track',
                    icon: LucideIcons.map_pin,
                    bgColor: const Color(0xFFDBEAFE),
                    iconColor: const Color(0xFF2563EB),
                  ),
                  QuickActionButton(
                    label: 'Calc Fare',
                    icon: LucideIcons.calculator,
                    bgColor: const Color(0xFFF3F4F6),
                    iconColor: const Color(0xFF4B5563),
                  ),
                  QuickActionButton(
                    label: 'My Orders',
                    icon: LucideIcons.package,
                    bgColor: const Color(0xFFEDE9FE),
                    iconColor: const Color(0xFF7C3AED),
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
                  ServiceListTile(title: 'Warehousing Services'),
                  ServiceListTile(title: 'Fleet Management'),
                  ServiceListTile(title: 'Past Shipments'),
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
                   const Icon(LucideIcons.sparkles, size: 16, color: Color(0xFF2563EB)), // Blue spark
                  const SizedBox(width: 8),
                  Text(
                    'AI ASSISTANTS',
                    style: TextStyle(
                      color: const Color(0xFF2563EB),
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
                            color: const Color(0xFFDBEAFE),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(LucideIcons.sparkles, size: 12, color: Color(0xFF2563EB)),
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
                      'Route Optimization',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Save 20 mins on the Trip #4582 via Highway 9.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                    ),
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
