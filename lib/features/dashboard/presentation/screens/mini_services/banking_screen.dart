import 'package:flutter/material.dart';

import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/core/common/widgets/section_header.dart';
class BankingScreen extends StatelessWidget {
  const BankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.go('/home'),
        ),
        title: const Text(
          'Banking Services',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE5E7EB), height: 1),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Section (Total Balance) ──
            Container(
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
                      fontSize: 28,
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

            const SizedBox(height: 24),

            // ── Quick Actions ──
            const SectionHeader(title: 'Quick Actions'),
            const SizedBox(height: AppDimensions.headerToContentSpacing),
            
            // Updated style: No Card wrapper, rounded square icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 _QuickAction(
                  icon: LucideIcons.arrow_right_left,
                  label: 'Transfer',
                  bgColor: const Color(0xFFDBEAFE),
                  iconColor: const Color(0xFF2563EB),
                ),
                _QuickAction(
                  icon: LucideIcons.receipt,
                  label: 'Pay Bill',
                  bgColor: const Color(0xFFFFEDD5),
                  iconColor: const Color(0xFFC2410C),
                ),
                _QuickAction(
                  icon: LucideIcons.banknote,
                  label: 'Loan',
                  bgColor: const Color(0xFFDCFCE7),
                  iconColor: const Color(0xFF15803D),
                ),
                _QuickAction(
                  icon: LucideIcons.file_text,
                  label: 'Statements',
                  bgColor: const Color(0xFFF3F4F6),
                  iconColor: const Color(0xFF4B5563),
                ),
              ],
            ),
            
            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Accounts ──
            const SectionHeader(title: 'Accounts'),
            const SizedBox(height: AppDimensions.headerToContentSpacing),
            _buildSectionCard(
              title: 'Accounts',
              child: _buildServiceRow([
                const _SvcItem(icon: LucideIcons.piggy_bank, label: 'Savings\nAccount', color: Color(0xFF0EA5E9)),
                 const _SvcItem(icon: LucideIcons.briefcase, label: 'Current\nAccount', color: Color(0xFF6366F1)),
                 const _SvcItem(icon: LucideIcons.building_2, label: 'Business\nAccount', color: Color(0xFF8B5CF6)),
                 const _SvcItem(icon: LucideIcons.timer, label: 'Fixed /\nTerm Deposit', color: Color(0xFF10B981)),
              ]), cardTitle: ''
            ),

            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Loans ──
            const SectionHeader(title: 'Loans'),
            const SizedBox(height: AppDimensions.headerToContentSpacing),
            _buildSectionCard(
              title: 'Loans',
              child: Column(
                children: [
                  _buildServiceRow([
                    const _SvcItem(icon: LucideIcons.user, label: 'Personal\nLoan', color: Color(0xFFF59E0B)),
                    const _SvcItem(icon: LucideIcons.store, label: 'Business /\nSME Loan', color: Color(0xFFEC4899)),
                    const _SvcItem(icon: LucideIcons.house, label: 'Home\nLoan', color: Color(0xFF3B82F6)),
                    const _SvcItem(icon: LucideIcons.car, label: 'Vehicle\nLoan', color: Color(0xFFEF4444)),
                  ]),
                  const SizedBox(height: 16),
                  _buildServiceRow([
                    const _SvcItem(icon: LucideIcons.tractor, label: 'Agricultural\nLoan', color: Color(0xFF15803D)),
                    const _SvcItem(icon: null, label: '', color: Colors.transparent),
                    const _SvcItem(icon: null, label: '', color: Colors.transparent),
                    const _SvcItem(icon: null, label: '', color: Colors.transparent),
                  ]),
                ],
              ), cardTitle: ''
            ),

            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Cards ──
            const SectionHeader(title: 'Cards'),
            const SizedBox(height: AppDimensions.headerToContentSpacing),
            _buildSectionCard(
              title: 'Cards',
              child: Column(
                children: [
                  _buildServiceRow([
                    const _SvcItem(icon: LucideIcons.credit_card, label: 'Classic /\nStandard', color: Color(0xFF64748B)),
                     const _SvcItem(icon: LucideIcons.percent, label: 'Cashback\nCard', color: Color(0xFFF97316)),
                     const _SvcItem(icon: LucideIcons.gift, label: 'Rewards\nCard', color: Color(0xFF8B5CF6)),
                     const _SvcItem(icon: LucideIcons.plane, label: 'Travel\nCard', color: Color(0xFF0EA5E9)),
                  ]),
                  const SizedBox(height: 16),
                  _buildServiceRow([
                    const _SvcItem(icon: LucideIcons.crown, label: 'Premium /\nSignature', color: Color(0xFFEAB308)),
                    const _SvcItem(icon: LucideIcons.lock, label: 'Secured\nCard', color: Color(0xFF14B8A6)),
                    const _SvcItem(icon: LucideIcons.building, label: 'Business /\nCorporate', color: Color(0xFF374151)),
                    const _SvcItem(icon: LucideIcons.users, label: 'Co-branded\nCard', color: Color(0xFFEC4899)),
                  ]),
                ],
              ), cardTitle: ''
            ),
            
            const SizedBox(height: AppDimensions.scrollBottomPadding),
          ],
        ),
      ),
    );
  }

  // ── Section Card wrapper ──
  Widget _buildSectionCard({
    required String? title, // Not used if cardTitle is provided
    required String cardTitle,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (cardTitle.isNotEmpty) ...[
            Text(
              cardTitle,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF9CA3AF),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }

  // ── Service Row (4 items) ──
  Widget _buildServiceRow(List<_SvcItem> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        if (item.label.isEmpty) {
          return const Expanded(child: SizedBox()); // Filler
        }
        return Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: item.icon != null ? Icon(item.icon!, color: item.color, size: 24) : const SizedBox(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF374151),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SvcItem {
  final IconData? icon;
  final String label;
  final Color color;
  const _SvcItem({required this.icon, required this.label, required this.color});
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconColor;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56, // Match main home size approx
          height: 56,
          decoration: BoxDecoration(
            // Removed white BG for icon box, using bgColor as per main home style
            color: bgColor, 
            borderRadius: BorderRadius.circular(16), // Rounded Square
            boxShadow: [
               BoxShadow(
                  color: iconColor.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
               )
            ]
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600, // Slightly bolder like main home
            color: Color(0xFF4B5563), // textSecondary
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
