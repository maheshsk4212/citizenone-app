import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:citizenone_app/core/common/widgets/quick_action_button.dart';
import 'package:citizenone_app/core/common/widgets/service_section_card.dart';
import 'package:citizenone_app/core/common/widgets/service_grid_row.dart';
import 'package:citizenone_app/core/common/widgets/section_header.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

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
                color: const Color(0xFF1D4ED8),
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF2563EB)],
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
                        style: TextStyle(fontSize: 12, color: Colors.white70),
                      ),
                      Text(
                        '+2.4% this month',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ── Quick Actions ──
            const SectionHeader(title: 'Quick Actions'),
            SizedBox(height: AppDimensions.headerToContentSpacing),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuickActionButton(
                  icon: LucideIcons.arrow_right_left,
                  label: 'Transfer',
                  bgColor: const Color(0xFFDBEAFE),
                  iconColor: const Color(0xFF2563EB),
                ),
                QuickActionButton(
                  icon: LucideIcons.receipt,
                  label: 'Pay Bill',
                  bgColor: const Color(0xFFFFEDD5),
                  iconColor: const Color(0xFFC2410C),
                ),
                QuickActionButton(
                  icon: LucideIcons.banknote,
                  label: 'Loan',
                  bgColor: const Color(0xFFDCFCE7),
                  iconColor: const Color(0xFF15803D),
                ),
                QuickActionButton(
                  icon: LucideIcons.file_text,
                  label: 'Statements',
                  bgColor: const Color(0xFFF3F4F6),
                  iconColor: const Color(0xFF4B5563),
                ),
              ],
            ),

            SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Accounts ──
            const SectionHeader(title: 'Accounts'),
            SizedBox(height: AppDimensions.headerToContentSpacing),
            ServiceSectionCard(
              title: '',
              child: ServiceGridRow(items: const [
                SvcItem(icon: LucideIcons.piggy_bank, label: 'Savings\nAccount', color: Color(0xFF0EA5E9)),
                SvcItem(icon: LucideIcons.briefcase, label: 'Current\nAccount', color: Color(0xFF6366F1)),
                SvcItem(icon: LucideIcons.building_2, label: 'Business\nAccount', color: Color(0xFF8B5CF6)),
                SvcItem(icon: LucideIcons.timer, label: 'Fixed /\nTerm Deposit', color: Color(0xFF10B981)),
              ]),
            ),

            SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Loans ──
            const SectionHeader(title: 'Loans'),
            SizedBox(height: AppDimensions.headerToContentSpacing),
            ServiceSectionCard(
              title: '',
              child: Column(
                children: [
                  const ServiceGridRow(items: [
                    SvcItem(icon: LucideIcons.user, label: 'Personal\nLoan', color: Color(0xFFF59E0B)),
                    SvcItem(icon: LucideIcons.store, label: 'Business /\nSME Loan', color: Color(0xFFEC4899)),
                    SvcItem(icon: LucideIcons.house, label: 'Home\nLoan', color: Color(0xFF3B82F6)),
                    SvcItem(icon: LucideIcons.car, label: 'Vehicle\nLoan', color: Color(0xFFEF4444)),
                  ]),
                  const SizedBox(height: 16),
                  const ServiceGridRow(items: [
                    SvcItem(icon: LucideIcons.tractor, label: 'Agricultural\nLoan', color: Color(0xFF15803D)),
                    SvcItem(icon: null, label: '', color: Colors.transparent),
                    SvcItem(icon: null, label: '', color: Colors.transparent),
                    SvcItem(icon: null, label: '', color: Colors.transparent),
                  ]),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Cards ──
            const SectionHeader(title: 'Cards'),
            SizedBox(height: AppDimensions.headerToContentSpacing),
            ServiceSectionCard(
              title: '',
              child: Column(
                children: [
                  const ServiceGridRow(items: [
                    SvcItem(icon: LucideIcons.credit_card, label: 'Classic /\nStandard', color: Color(0xFF64748B)),
                    SvcItem(icon: LucideIcons.percent, label: 'Cashback\nCard', color: Color(0xFFF97316)),
                    SvcItem(icon: LucideIcons.gift, label: 'Rewards\nCard', color: Color(0xFF8B5CF6)),
                    SvcItem(icon: LucideIcons.plane, label: 'Travel\nCard', color: Color(0xFF0EA5E9)),
                  ]),
                  const SizedBox(height: 16),
                  const ServiceGridRow(items: [
                    SvcItem(icon: LucideIcons.crown, label: 'Premium /\nSignature', color: Color(0xFFEAB308)),
                    SvcItem(icon: LucideIcons.lock, label: 'Secured\nCard', color: Color(0xFF14B8A6)),
                    SvcItem(icon: LucideIcons.building, label: 'Business /\nCorporate', color: Color(0xFF374151)),
                    SvcItem(icon: LucideIcons.users, label: 'Co-branded\nCard', color: Color(0xFFEC4899)),
                  ]),
                ],
              ),
            ),

            SizedBox(height: AppDimensions.scrollBottomPadding),
          ],
        ),
      ),
    );
  }
}
