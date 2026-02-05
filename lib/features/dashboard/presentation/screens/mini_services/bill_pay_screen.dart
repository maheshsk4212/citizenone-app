import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class BillPayScreen extends StatelessWidget {
  const BillPayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Bill Payments',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.orange[100]!),
          boxShadow: [
            BoxShadow(color: Colors.orange.withOpacity(0.1), blurRadius: 16, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TOTAL DUE',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            ),
            const SizedBox(height: 8),
            const Text(
              'ZK 1,450.00',
              style: TextStyle(color: AppColors.textPrimary, fontSize: 32, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 4),
            const Text(
              'Due within 3 days',
              style: TextStyle(color: Color(0xFFEF4444), fontSize: 12, fontWeight: FontWeight.w500),
            ),
             const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEA580C), // orange-600
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Pay All Bills', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(icon: LucideIcons.zap, label: 'Electricity', color: const Color(0xFFEAB308)),
        QuickActionItem(icon: LucideIcons.droplets, label: 'Water', color: const Color(0xFF3B82F6)),
        QuickActionItem(icon: LucideIcons.smartphone, label: 'Mobile', color: const Color(0xFFA855F7)),
        QuickActionItem(icon: LucideIcons.plus, label: 'Add New', color: const Color(0xFF64748B)),
      ],
      services: [
        ServiceListItem(title: 'Payment History', onTap: () {}),
        ServiceListItem(title: 'Manage Billers', onTap: () {}),
        ServiceListItem(title: 'Auto-Pay Settings', onTap: () {}),
      ],
      aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: const Color(0xFFFFEDD5)), // orange-100
           boxShadow: AppColors.shadowSm,
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text(
               'Bill Prediction',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
             ),
             const SizedBox(height: 8),
             const Text(
               'Your electricity bill is expected to be 10% lower next month.',
               style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
             ),
             const SizedBox(height: 16),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFFEA580C), // orange-600
                   foregroundColor: Colors.white,
                   elevation: 0,
                 ),
                 child: const Text('View Usage'),
               ),
             )
           ],
         ),
      ),
    );
  }
}
