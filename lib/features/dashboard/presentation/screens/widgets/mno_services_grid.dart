import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';

class MnoServicesGrid extends StatelessWidget {
  const MnoServicesGrid({super.key});

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
        
        _buildCategory('Mobile Services', [
          _ServiceItem('Airtime', LucideIcons.smartphone, const Color(0xFF3B82F6)),
          _ServiceItem('Data Bundles', LucideIcons.wifi, const Color(0xFF06B6D4)),
          _ServiceItem('SMS Packages', LucideIcons.message_square, const Color(0xFF8B5CF6)),
        ]),
        
        const SizedBox(height: AppDimensions.sectionVerticalSpacing),
        
        _buildCategory('Mobile Money', [
          _ServiceItem('Send Money', LucideIcons.send, const Color(0xFF22C55E)),
          _ServiceItem('Withdraw', LucideIcons.arrow_down_to_line, const Color(0xFFEF4444)),
          _ServiceItem('Pay Bills', LucideIcons.receipt, const Color(0xFFF59E0B)),
          _ServiceItem('Buy Goods', LucideIcons.shopping_cart, const Color(0xFF64748B)),
        ]),
        
        const SizedBox(height: AppDimensions.sectionVerticalSpacing),
        
        _buildCategory('Account Services', [
          _ServiceItem('Balance', LucideIcons.wallet, const Color(0xFF3B82F6)),
          _ServiceItem('Mini Statement', LucideIcons.file_text, const Color(0xFF64748B)),
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
          style: TextStyle(
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
  final Color iconColor;

  const _ServiceItem(this.label, this.icon, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            width: AppDimensions.iconBoxSize,
            height: AppDimensions.iconBoxSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey[100]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: iconColor, size: AppDimensions.iconSize),
          ),
          const SizedBox(height: AppDimensions.iconToLabelGap),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
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
