import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class GovtServicesScreen extends StatelessWidget {
  const GovtServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Government Services',
      hero: Container(
        height: 120, // Approx height based on image
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF0891B2), // Cyan-700
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF0E7490), Color(0xFF06B6D4)], // Cyan-700 to Cyan-500
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          image: const DecorationImage(
             image: AssetImage('assets/images/govt_bg_pattern.png'), // Placeholder or use icon
             fit: BoxFit.cover,
             opacity: 0.1,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Citizen Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'One-stop access to all government portals.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
             const Positioned(
               right: 0,
               bottom: 0,
               top: 0,
               child: Icon(LucideIcons.landmark, size: 60, color: Colors.white24),
             ),
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(
          icon: LucideIcons.scale,
          label: 'Taxes',
          backgroundColor: const Color(0xFFCFFAFE), // Cyan-100
          iconColor: const Color(0xFF0891B2), // Cyan-700
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.stamp,
          label: 'Certificates',
          backgroundColor: const Color(0xFFFFEDD5), // Orange-100
          iconColor: const Color(0xFFC2410C), // Orange-700
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.file_text,
          label: 'Land Records',
          backgroundColor: const Color(0xFFDCFCE7), // Green-100
          iconColor: const Color(0xFF15803D), // Green-700
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.files,
          label: 'My Docs',
          backgroundColor: const Color(0xFFF3F4F6), // Gray-100
          iconColor: const Color(0xFF4B5563), // Gray-600
          onTap: () {},
        ),
      ],
      services: [
        ServiceListItem(title: 'Birth & Death Registration', onTap: () {}),
        ServiceListItem(title: 'Pension Services', onTap: () {}),
        ServiceListItem(title: 'RTI Applications', onTap: () {}),
      ],
      aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE0F2FE)), // light blue
          boxShadow: AppColors.shadowSm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(LucideIcons.sparkles, size: 16, color: Color(0xFF3B82F6)),
                SizedBox(width: 8),
                Text(
                  'CITIZEN AI ALERT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Eligibility Check',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You may be eligible for the new Housing Subsidy Scheme.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // Blue-600
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('View Details', style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
