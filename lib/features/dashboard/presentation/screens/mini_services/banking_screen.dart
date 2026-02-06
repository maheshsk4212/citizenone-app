import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class BankingScreen extends StatelessWidget {
  const BankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Banking',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1D4ED8), // Blue-700
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF1E40AF), Color(0xFF2563EB)], // Blue-800 to Blue-600
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1E40AF).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
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
                  'Total Balance',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(LucideIcons.wallet, color: Colors.white, size: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'ZK 125,000.00',
              style: TextStyle(
                fontSize: 28, // Sligthly smaller than Wealth to fit
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.white.withOpacity(0.1), height: 1),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Savings: **** 4589',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  '+2.4% this month',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(
          icon: LucideIcons.arrow_right_left,
          label: 'Transfer',
          backgroundColor: const Color(0xFFDBEAFE), // Blue-100
          iconColor: const Color(0xFF2563EB), // Blue-600
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.receipt, // Closest matching "Bill"
          label: 'Pay Bill',
          backgroundColor: const Color(0xFFFFEDD5), // Orange-100
          iconColor: const Color(0xFFC2410C), // Orange-700
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.banknote,
          label: 'Loan',
          backgroundColor: const Color(0xFFDCFCE7), // Green-100
          iconColor: const Color(0xFF15803D), // Green-700
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.file_text,
          label: 'Statements',
          backgroundColor: const Color(0xFFF3F4F6), // Gray-100
          iconColor: const Color(0xFF4B5563), // Gray-600
          onTap: () {},
        ),
      ],
      services: [
        ServiceListItem(title: 'My Accounts', onTap: () {}),
        ServiceListItem(title: 'Loans & Liabilities', onTap: () {}),
        ServiceListItem(title: 'Manage Cards', onTap: () {}),
        ServiceListItem(title: 'Scheduled Transfers', onTap: () {}),
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
              'Credit Score Update',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your score increased by 15 points! You serve better loan rates now.',
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
