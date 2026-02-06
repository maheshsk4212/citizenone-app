import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';

class PartnerServicesGrid extends StatelessWidget {
  const PartnerServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'AVAILABLE SERVICES',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFF64748B), // slate-500
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 24),
        
        _buildCategory('Customer Services', [
          _ServiceItem('Onboarding', LucideIcons.user_plus, const Color(0xFFEFF6FF), const Color(0xFF3B82F6)),
          _ServiceItem('eKYC', LucideIcons.scan, const Color(0xFFEFF6FF), const Color(0xFF3B82F6)),
          _ServiceItem('Profile', LucideIcons.search, const Color(0xFFF8FAFC), const Color(0xFF64748B)),
        ]),
        
        const SizedBox(height: 32),
        
        _buildCategory('Money Transfer', [
          _ServiceItem('Top Up', LucideIcons.wallet, const Color(0xFFF0FDF4), const Color(0xFF22C55E)),
          _ServiceItem('Redeem', LucideIcons.credit_card, const Color(0xFFECFEFF), const Color(0xFF06B6D4)),
          _ServiceItem('Deposit', LucideIcons.arrow_up_from_line, const Color(0xFFF0FDF4), const Color(0xFF22C55E)),
          _ServiceItem('Withdrawal', LucideIcons.arrow_down_to_line, const Color(0xFFFEF2F2), const Color(0xFFEF4444)),
          _ServiceItem('Transfer', LucideIcons.arrow_left_right, const Color(0xFFFAF5FF), const Color(0xFFA855F7)),
        ]),
        
        const SizedBox(height: 32),
        
        _buildCategory('Loan Services', [
          _ServiceItem('Apply Loan', LucideIcons.file_text, const Color(0xFFFFFBEB), const Color(0xFFF59E0B)),
          _ServiceItem('Repay (Cust)', LucideIcons.calendar_plus, const Color(0xFFFFF7ED), const Color(0xFFF97316)),
          _ServiceItem('Repay (Acc)', LucideIcons.credit_card, const Color(0xFFECFEFF), const Color(0xFF06B6D4)),
        ]),
      ],
    );
  }

  Widget _buildCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 20,
          runSpacing: 24,
          children: items,
        ),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const _ServiceItem(this.label, this.icon, this.bgColor, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
