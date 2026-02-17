import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class GovtServicesScreen extends StatelessWidget {
  const GovtServicesScreen({super.key});

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
          'Government Services',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ──
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xFF0E7490), Color(0xFF06B6D4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Citizen Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'One-stop access to all government portals.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.85),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      LucideIcons.landmark,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Quick Actions ──
            _buildSectionCard(
              title: 'Quick Actions',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _QuickAction(
                    icon: LucideIcons.scale,
                    label: 'Taxes',
                    bgColor: const Color(0xFFCFFAFE),
                    iconColor: const Color(0xFF0891B2),
                  ),
                  _QuickAction(
                    icon: LucideIcons.stamp,
                    label: 'Certificates',
                    bgColor: const Color(0xFFFFEDD5),
                    iconColor: const Color(0xFFC2410C),
                  ),
                  _QuickAction(
                    icon: LucideIcons.file_text,
                    label: 'Land Records',
                    bgColor: const Color(0xFFDCFCE7),
                    iconColor: const Color(0xFF15803D),
                  ),
                  _QuickAction(
                    icon: LucideIcons.files,
                    label: 'My Docs',
                    bgColor: const Color(0xFFF3E8FF),
                    iconColor: const Color(0xFF7C3AED),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Health ──
            _buildSectionCard(
              title: 'Health',
              child: _buildServiceRow([
                _SvcItem(icon: LucideIcons.shield_check, label: 'Health\nInsurance', color: const Color(0xFFEF4444)),
                _SvcItem(icon: LucideIcons.baby, label: 'Birth\nCertificate', color: const Color(0xFF3B82F6)),
                _SvcItem(icon: LucideIcons.file_heart, label: 'Death\nCertificate', color: const Color(0xFF6B7280)),
                _SvcItem(icon: LucideIcons.dumbbell, label: 'Physical\nFitness', color: const Color(0xFF10B981)),
              ]),
            ),

            const SizedBox(height: AppDimensions.sectionVerticalSpacing),

            // ── Education ──
            _buildSectionCard(
              title: 'Education',
              child: _buildServiceRow([
                _SvcItem(icon: LucideIcons.graduation_cap, label: 'Scholar-\nships', color: const Color(0xFF8B5CF6)),
                _SvcItem(icon: LucideIcons.book_open, label: 'School\nAdmissions', color: const Color(0xFFF97316)),
                _SvcItem(icon: LucideIcons.award, label: 'Skill\nCertificates', color: const Color(0xFF14B8A6)),
                _SvcItem(icon: LucideIcons.library, label: 'Digital\nLibrary', color: const Color(0xFF6366F1)),
              ]),
            ),

            const SizedBox(height: 20),

            // ── Land & Property ──
            _buildSectionCard(
              title: 'Land & Property',
              child: _buildServiceRow([
                _SvcItem(icon: LucideIcons.map, label: 'Land\nRecords', color: const Color(0xFF059669)),
                _SvcItem(icon: LucideIcons.house, label: 'Property\nTax', color: const Color(0xFFD97706)),
                _SvcItem(icon: LucideIcons.file_check, label: 'Encum-\nbrance', color: const Color(0xFF0284C7)),
                _SvcItem(icon: LucideIcons.ruler, label: 'Survey &\nMutation', color: const Color(0xFF7C3AED)),
              ]),
            ),

            const SizedBox(height: 20),

            // ── Civic & Welfare ──
            _buildSectionCard(
              title: 'Civic & Welfare',
              child: _buildServiceRow([
                _SvcItem(icon: LucideIcons.id_card, label: 'Aadhaar\nServices', color: const Color(0xFFE11D48)),
                _SvcItem(icon: LucideIcons.vote, label: 'Voter\nID', color: const Color(0xFF2563EB)),
                _SvcItem(icon: LucideIcons.hand_coins, label: 'Pension\nServices', color: const Color(0xFFF59E0B)),
                _SvcItem(icon: LucideIcons.scroll_text, label: 'RTI\nApplications', color: const Color(0xFF64748B)),
              ]),
            ),

            const SizedBox(height: 28),

            // ── Related Updates ──
            const Text(
              'RELATED UPDATES',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF9CA3AF),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 12),
            _BlogCard(
              title: 'New Digital Health ID: What You Need to Know',
              snippet: 'The Govt. has launched Ayushman Bharat Health Account (ABHA). Get your unique digital health ID today.',
              date: 'Feb 10, 2026',
            ),
            const SizedBox(height: 10),
            _BlogCard(
              title: 'Updated Land Registration Process 2026',
              snippet: 'Simplified steps to register your property online with the new portal.',
              date: 'Jan 28, 2026',
            ),

            const SizedBox(height: AppDimensions.scrollBottomPadding),
          ],
        ),
      ),
    );
  }

  // ── Section Card wrapper ──
  static Widget _buildSectionCard({
    required String title,
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
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF9CA3AF),
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  // ── Service Row (4 items) ──
  static Widget _buildServiceRow(List<_SvcItem> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
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
                    child: Icon(item.icon, color: item.color, size: 24),
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

// ─────────────────────────────────────────────
//  Data model
// ─────────────────────────────────────────────
class _SvcItem {
  final IconData icon;
  final String label;
  final Color color;
  const _SvcItem({required this.icon, required this.label, required this.color});
}

// ─────────────────────────────────────────────
//  Quick Action
// ─────────────────────────────────────────────
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
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  Blog Card
// ─────────────────────────────────────────────
class _BlogCard extends StatelessWidget {
  final String title;
  final String snippet;
  final String date;

  const _BlogCard({
    required this.title,
    required this.snippet,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(LucideIcons.newspaper, size: 18, color: Color(0xFF3B82F6)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  snippet,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.chevron_right, size: 18, color: Color(0xFFD1D5DB)),
          ),
        ],
      ),
    );
  }
}
