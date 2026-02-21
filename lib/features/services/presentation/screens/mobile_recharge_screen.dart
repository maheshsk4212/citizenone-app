import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class MobileRechargeScreen extends StatelessWidget {
  const MobileRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Mobile & Airtime',
      hero: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF7C3AED), // Purple-600
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF8B5CF6)], // Purple-600 to Purple-500
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7C3AED).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MY NUMBER',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '+1 987 654 3210',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                       Text(
                        'Prepaid • Expires in 12 days',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const Icon(LucideIcons.smartphone, color: Colors.white, size: 32),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Text(
                'Data: 1.2 GB left',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      quickActions: [
        QuickActionData(
          icon: LucideIcons.smartphone_charging,
          label: 'Recharge',
          backgroundColor: const Color(0xFFF3E8FF), // Purple-100
          iconColor: const Color(0xFF9333EA), // Purple-600
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.wifi,
          label: 'Data Pack',
          backgroundColor: const Color(0xFFDBEAFE), // Blue-100
          iconColor: const Color(0xFF2563EB), // Blue-600
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.credit_card,
          label: 'Pay Bill',
          backgroundColor: const Color(0xFFFFEDD5), // Orange-100
          iconColor: const Color(0xFFC2410C), // Orange-700
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.history,
          label: 'History',
          backgroundColor: const Color(0xFFF3F4F6), // Gray-100
          iconColor: const Color(0xFF4B5563), // Gray-600
          onTap: () {},
        ),
      ],
      services: [
        ServiceListData(title: 'Popular Plans', onTap: () {}),
        ServiceListData(title: 'Family Accounts', onTap: () {}),
        ServiceListData(title: 'Roaming Services', onTap: () {}),
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
              'Plan Expiring',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your 5G Data Pack expires tomorrow. Recharge now.',
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
