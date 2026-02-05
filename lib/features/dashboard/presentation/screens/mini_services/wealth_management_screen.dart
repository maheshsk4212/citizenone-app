import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class WealthManagementScreen extends StatelessWidget {
  const WealthManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Wealth Management',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF312E81), // indigo-900
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF312E81), Color(0xFF4338CA)], // indigo-900 to 700
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x4D312E81), blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Total Portfolio Value',
              style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'ZK 582,400.00',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.trending_up, color: Color(0xFF4ADE80), size: 16), // green-400
                  SizedBox(width: 4),
                  Text(
                    '+8.4% (YTD)',
                    style: TextStyle(color: Color(0xFF4ADE80), fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(icon: LucideIcons.trending_up, label: 'Invest', color: const Color(0xFF6366F1)),
        QuickActionItem(icon: LucideIcons.circle_dollar_sign, label: 'Funds', color: const Color(0xFF10B981)),
        QuickActionItem(icon: LucideIcons.piggy_bank, label: 'SIPs', color: const Color(0xFFEC4899)),
        QuickActionItem(icon: LucideIcons.briefcase, label: 'Advisory', color: const Color(0xFF64748B)),
      ],
      services: [
        ServiceListItem(title: 'Mutual Fund Operations', onTap: () {}),
        ServiceListItem(title: 'Fixed Deposits', onTap: () {}),
        ServiceListItem(title: 'Pension Plans (NPS)', onTap: () {}),
      ],
      aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: const Color(0xFFFEF9C3)), // yellow-100
           boxShadow: AppColors.shadowSm,
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text(
               'Goal Analysis',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
             ),
             const SizedBox(height: 8),
             const Text(
               'You are on track to reach your "New Car" goal by Dec 2026.',
               style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
             ),
             const SizedBox(height: 16),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFFEAB308), // yellow-500
                   foregroundColor: Colors.white,
                   elevation: 0,
                 ),
                 child: const Text('View Details'),
               ),
             )
           ],
         ),
      ),
    );
  }
}
