import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Insurance',
      hero: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444), // Red accent
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '3 Active Policies',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPolicyRow('Health (Family)', 'Active', const Color(0xFF10B981)),
                    const SizedBox(height: 12),
                    _buildPolicyRow('Car (Honda City)', 'Renew in 5d', const Color(0xFFF97316)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      quickActions: [
        QuickActionData(
          icon: LucideIcons.plus,
          label: 'Buy New',
          backgroundColor: const Color(0xFFFEE2E2), // Red-100
          iconColor: const Color(0xFFEF4444), // Red-500
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.refresh_cw,
          label: 'Renew',
          backgroundColor: const Color(0xFFFFEAD0), // Orange-100 (approx)
          iconColor: const Color(0xFFF97316), // Orange-500
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.file_text,
          label: 'Claim',
          backgroundColor: const Color(0xFFF3F4F6), // Gray-100
          iconColor: const Color(0xFF4B5563), // Gray-600
          onTap: () {},
        ),
        QuickActionData(
          icon: LucideIcons.shield,
          label: 'My Policies',
          backgroundColor: const Color(0xFFDBEAFE), // Blue-100
          iconColor: const Color(0xFF3B82F6), // Blue-500
          onTap: () {},
        ),
      ],
      services: [
        ServiceListData(title: 'Network Hospitals', onTap: () {}),
        ServiceListData(title: 'Download Policy Copy', onTap: () {}),
        ServiceListData(title: 'Claim Status', onTap: () {}),
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
              'Renewal Alert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Car Insurance expires in 5 days. Renew now to avoid inspection.',
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

  Widget _buildPolicyRow(String name, String status, Color statusColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF64748B), // Slate-500
          ),
        ),
        Text(
          status,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: statusColor,
          ),
        ),
      ],
    );
  }
}
