import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/core/common/widgets/press_scale_widget.dart';
import 'package:citizenone_app/core/common/widgets/staggered_entry_list.dart';

class PartnerSelectionScreen extends ConsumerWidget {
  const PartnerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Partner',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose assigned partner to access operations.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 24),
          
          // Search Bar
          TextField(
             decoration: InputDecoration(
               hintText: 'Search partners...',
               hintStyle: TextStyle(color: Colors.grey[400]),
               prefixIcon: const Icon(LucideIcons.search, color: Colors.grey),
               filled: true,
               fillColor: Colors.white,
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                 borderSide: BorderSide(color: Colors.grey[200]!),
               ),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
                 borderSide: BorderSide(color: Colors.grey[200]!),
               ),
               contentPadding: const EdgeInsets.symmetric(vertical: 16),
             ),
          ),
          const SizedBox(height: 32),

          const SizedBox(height: 32),

          StaggeredEntryList(
            children: [
              _buildSection(
                title: 'BANK PARTNERS',
                count: 2,
                children: [
                  _PartnerItem(
                    name: 'Citizen Bank',
                    subtitle: 'National Bank',
                    icon: LucideIcons.landmark,
                    color: const Color(0xFFDBEAFE), // Blue-100
                    iconColor: const Color(0xFF2563EB), // Blue-600
                    onTap: () => ref.read(authProvider.notifier).setPartner('Citizen Bank', LucideIcons.landmark, 'Bank'),
                  ),
                  _PartnerItem(
                    name: 'Rural Algo Bank',
                    subtitle: 'Microfinance',
                     icon: LucideIcons.landmark,
                    color: const Color(0xFFDCFCE7), // Green-100
                    iconColor: const Color(0xFF16A34A), // Green-600
                    onTap: () => ref.read(authProvider.notifier).setPartner('Rural Algo Bank', LucideIcons.landmark, 'Bank'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
               _buildSection(
                title: 'INSURANCE PARTNERS',
                count: 1,
                children: [
                  _PartnerItem(
                    name: 'SafeGuard Life',
                    subtitle: 'Life & Health',
                    icon: LucideIcons.shield_check,
                    color: const Color(0xFFFEE2E2), // Red-100
                    iconColor: const Color(0xFFEF4444), // Red-500
                    onTap: () => ref.read(authProvider.notifier).setPartner('SafeGuard Life', LucideIcons.shield_check, 'Insurance'),
                  ),
                ],
              ),
               const SizedBox(height: 16),
               _buildSection(
                title: 'MNO PARTNERS',
                count: 1,
                children: [
                  _PartnerItem(
                    name: 'ConnectZambia',
                    subtitle: 'Telecom',
                    icon: LucideIcons.smartphone,
                    color: const Color(0xFFF3E8FF), // Purple-100
                    iconColor: const Color(0xFF9333EA), // Purple-600
                    onTap: () => ref.read(authProvider.notifier).setPartner('ConnectZambia', LucideIcons.smartphone, 'MNO'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildSection({required String title, required int count, required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          initiallyExpanded: true,
          children: children,
        ),
      ),
    );
  }
}

class _PartnerItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onTap;

  const _PartnerItem({
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: PressScaleWidget(
        onPressed: onTap,
        child: Container(
          decoration: BoxDecoration(
             border: Border(top: BorderSide(color: Colors.grey[50]!)),
             color: Colors.transparent, // Ensure hit test works
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            title: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
          ),
        ),
      ),
    );
  }
}
