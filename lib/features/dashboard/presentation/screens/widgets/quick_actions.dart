import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:go_router/go_router.dart';

class QuickActions extends StatelessWidget {
  final UserRole role;

  const QuickActions({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
          child: Text(
            'QUICK ACTIONS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.textSecondary,
              letterSpacing: 1.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getActions(role).map((action) => _buildActionItem(context, action)).toList(),
        ),
      ],
    );
  }

  List<_ActionItem> _getActions(UserRole role) {
    if (role == UserRole.agent) {
      return [
        _ActionItem('Onboard', LucideIcons.user_plus, const Color(0xFFE0E7FF), const Color(0xFF4F46E5)), // Indigo
        _ActionItem('Collect', LucideIcons.wallet, const Color(0xFFD1FAE5), const Color(0xFF059669)), // Emerald
        _ActionItem('Today Tasks', LucideIcons.clipboard_list, const Color(0xFFFEF3C7), const Color(0xFFD97706)), // Amber
        _ActionItem('Support', LucideIcons.life_buoy, const Color(0xFFF3F4F6), const Color(0xFF4B5563)), // Gray
      ];
    }
    // Default Citizen
    return [
      _ActionItem('Pay', LucideIcons.send, const Color(0xFFDBEAFE), const Color(0xFF2563EB), route: '/services/bills'), // Blue
      _ActionItem('Scan QR', LucideIcons.qr_code, const Color(0xFFF3E8FF), const Color(0xFF9333EA)), // Purple
      _ActionItem('Apply Loan', LucideIcons.banknote, const Color(0xFFFFEDD5), const Color(0xFFEA580C), route: '/services/loans'), // Orange
      _ActionItem('Support', LucideIcons.life_buoy, const Color(0xFFDCFCE7), const Color(0xFF16A34A)), // Green
    ];
  }

  Widget _buildActionItem(BuildContext context, _ActionItem action) {
    return GestureDetector(
      onTap: () {
        if (action.route != null) {
          context.push(action.route!);
        }
      },
      child: Column(
        children: [
          Container(
            width: 56, // Slightly wider to match design
            height: 56,
            decoration: BoxDecoration(
              color: action.bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(action.icon, size: 24, color: action.iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            action.label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ActionItem {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String? route;

  _ActionItem(this.label, this.icon, this.bgColor, this.iconColor, {this.route});
}
