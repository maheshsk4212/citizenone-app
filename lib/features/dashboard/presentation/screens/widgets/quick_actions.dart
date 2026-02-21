import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/common/widgets/press_scale_widget.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';

import 'package:citizenone_app/core/design_system/responsive.dart';
import 'package:citizenone_app/core/common/widgets/quick_action_button.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class QuickActions extends StatelessWidget {
  final UserRole role;

  const QuickActions({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: ResponsiveLayout.isDesktop(context) ? double.infinity : 800
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: _buildResponsiveLayout(context, role),
      ),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context, UserRole role) {
    bool isWeb = ResponsiveLayout.isDesktop(context);
    List<_ActionItem> actions = _getActions(role);
    
    if (isWeb) {
       return Wrap(
          spacing: 32,
          runSpacing: 24,
          alignment: WrapAlignment.start,
          children: actions.map((action) => _buildActionItem(context, action)).toList(),
       );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: actions.map((action) => _buildActionItem(context, action)).toList(),
    );
  }


  List<_ActionItem> _getActions(UserRole role) {
    if (role == UserRole.farmer) {
      return [
        _ActionItem('Agri Loan', LucideIcons.sprout, const Color(0xFFDCFCE7), const Color(0xFF16A34A), route: '/loans'), // Green
        _ActionItem('Weather', LucideIcons.cloud, const Color(0xFFE0F2FE), const Color(0xFF0284C7)), // Sky
        _ActionItem('Market', LucideIcons.shopping_cart, const Color(0xFFFFEDD5), const Color(0xFFEA580C), route: '/services/market'), // Orange
        _ActionItem('Support', LucideIcons.life_buoy, const Color(0xFFF3F4F6), const Color(0xFF4B5563)), // Gray
      ];
    }
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
      _ActionItem('Apply Loan', LucideIcons.banknote, const Color(0xFFFFEDD5), const Color(0xFFEA580C), route: '/loans'), // Orange
      _ActionItem('Support', LucideIcons.life_buoy, const Color(0xFFDCFCE7), const Color(0xFF16A34A)), // Green
    ];
  }

  Widget _buildActionItem(BuildContext context, _ActionItem action) {
    return QuickActionButton(
      label: action.label,
      icon: action.icon,
      bgColor: action.bgColor,
      iconColor: action.iconColor,
      onTap: () {
        if (action.route != null) {
          context.push(action.route!);
        }
      },
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
