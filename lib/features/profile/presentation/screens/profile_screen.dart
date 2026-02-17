import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

// ═══════════════════════════════════════════════════════════════════
//  PROFILE SCREEN — Scroll-Optimized • Tab-Based • Production UX
//
//  Layout:  Smart Card  →  Tab Bar  →  Tab Content  →  More  →  Actions
//  Result:  45–65% scroll reduction vs accordion stack
// ═══════════════════════════════════════════════════════════════════

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isAgent = false;

  // Customer tabs
  static const _customerTabs = ['Personal', 'Security', 'Services', 'Payments'];
  // Agent tabs
  static const _agentTabs = ['Profile', 'Work', 'Transactions', 'Performance'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isAgent = authState.selectedRole == UserRole.agent;

    // Rebuild tab controller if role changed
    if (isAgent != _isAgent) {
      _isAgent = isAgent;
      _tabController.index = 0;
    }

    final tabs = isAgent ? _agentTabs : _customerTabs;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF7F8FA),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, AppDimensions.scrollBottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── 1. SMART CARD (Identity + Stats merged) ──
            isAgent
                ? _buildAgentSmartCard(authState)
                : _buildCustomerSmartCard(authState),

            const SizedBox(height: 14),

            // ── 2. TAB BAR ──
            _buildTabBar(tabs),

            const SizedBox(height: 2),

            // ── 3. TAB CONTENT ──
            AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    key: ValueKey('tab_${_tabController.index}_$isAgent'),
                    child: isAgent
                        ? _buildAgentTabContent(_tabController.index)
                        : _buildCustomerTabContent(_tabController.index),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // ── 4. MORE (Settings + Support + About grouped) ──
            isAgent
                ? _buildAgentMoreSection()
                : _buildCustomerMoreSection(),

            const SizedBox(height: 20),

            // ── 5. ACTIONS ──
            _ActionButton(
              label: 'Log Out',
              icon: LucideIcons.log_out,
              color: const Color(0xFFEF4444),
              bgColor: const Color(0xFFFEF2F2),
              borderColor: const Color(0xFFFECACA),
              onTap: () => context.go('/login'),
            ),
            const SizedBox(height: 8),
            _ActionButton(
              label: 'Deactivate / Close Account',
              icon: LucideIcons.user_x,
              color: const Color(0xFF9CA3AF),
              bgColor: const Color(0xFFF9FAFB),
              borderColor: const Color(0xFFE5E7EB),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CUSTOMER SMART CARD
  // ─────────────────────────────────────────────

  Widget _buildCustomerSmartCard(dynamic authState) {
    return _SmartProfileCard(
      avatarIcon: Icons.face_3_rounded,
      avatarGradient: const [Color(0xFFFDE68A), Color(0xFFF59E0B)],
      name: 'Mahesh Kumar',
      role: 'Gold Member',
      badgeText: 'GOLD',
      badgeColor: const Color(0xFFF59E0B),
      benefitHint: '3 Gold benefits available',
      accountId: 'CZ-XXXXXX4829',
      lastLogin: 'Today, 2:15 PM',
      partner: authState.selectedPartner,
      partnerIcon: authState.partnerIcon,
      stats: const [
        _StatChip(icon: LucideIcons.shield_check, value: 'Verified', label: 'KYC', color: Color(0xFF10B981)),
        _StatChip(icon: LucideIcons.credit_card, value: '2 Linked', label: 'Cards', color: Color(0xFF3B82F6)),
        _StatChip(icon: LucideIcons.banknote, value: '1 Active', label: 'Loans', color: Color(0xFFF59E0B)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  AGENT SMART CARD
  // ─────────────────────────────────────────────

  Widget _buildAgentSmartCard(dynamic authState) {
    return _SmartProfileCard(
      avatarIcon: LucideIcons.briefcase,
      avatarGradient: const [Color(0xFF93C5FD), Color(0xFF3B82F6)],
      name: 'Rajesh Patel',
      role: 'Field Agent',
      badgeText: 'VERIFIED',
      badgeColor: const Color(0xFF10B981),
      benefitHint: 'Lusaka Region • Active',
      accountId: 'AGT-20260112',
      lastLogin: 'Today, 1:45 PM',
      partner: authState.selectedPartner,
      partnerIcon: authState.partnerIcon,
      stats: const [
        _StatChip(icon: LucideIcons.users, value: '48', label: 'Customers', color: Color(0xFF3B82F6)),
        _StatChip(icon: LucideIcons.target, value: '85%', label: 'Target', color: Color(0xFF10B981)),
        _StatChip(icon: LucideIcons.indian_rupee, value: '₹12.4K', label: 'Earnings', color: Color(0xFFF59E0B)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  TAB BAR
  // ─────────────────────────────────────────────

  Widget _buildTabBar(List<String> tabs) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: const Color(0xFF6B7280),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.1,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: EdgeInsets.zero,
        tabs: tabs.map((t) => Tab(height: 36, text: t)).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CUSTOMER TAB CONTENT
  // ─────────────────────────────────────────────

  Widget _buildCustomerTabContent(int index) {
    switch (index) {
      case 0:
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.user, label: 'Profile Details', color: const Color(0xFF3B82F6)),
          _MenuRow(icon: LucideIcons.phone, label: 'Contact Details', color: const Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.map_pin, label: 'Address Information', color: const Color(0xFFF97316)),
          _MenuRow(icon: LucideIcons.shield_check, label: 'KYC / Verification', color: const Color(0xFF8B5CF6), badge: 'Verified'),
        ]);
      case 1:
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.lock_keyhole, label: 'Change PIN / Password', color: const Color(0xFFEF4444)),
          _MenuRow(icon: LucideIcons.scan, label: 'Biometric Authentication', color: const Color(0xFF6366F1)),
          _MenuRow(icon: LucideIcons.monitor_smartphone, label: 'Login Activity', color: const Color(0xFF0EA5E9)),
          _MenuRow(icon: LucideIcons.file_lock, label: 'Consent & Data Permissions', color: const Color(0xFF64748B)),
        ]);
      case 2:
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.banknote, label: 'My Loans', color: const Color(0xFF059669), badge: '1'),
          _MenuRow(icon: LucideIcons.calendar_clock, label: 'Loan Repayment Schedule', color: const Color(0xFF0284C7)),
          _MenuRow(icon: LucideIcons.shield, label: 'My Insurance Policies', color: const Color(0xFFE11D48)),
          _MenuRow(icon: LucideIcons.clipboard_list, label: 'Insurance Coverage', color: const Color(0xFF7C3AED)),
          _MenuRow(icon: LucideIcons.landmark, label: 'Subsidies & Govt Benefits', color: const Color(0xFFD97706)),
          _MenuRow(icon: LucideIcons.list_checks, label: 'Service Requests', color: const Color(0xFF475569)),
        ]);
      case 3:
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.building_2, label: 'Linked Bank Accounts', color: const Color(0xFF2563EB)),
          _MenuRow(icon: LucideIcons.wallet, label: 'Linked Wallets / Cards', color: const Color(0xFF8B5CF6)),
          _MenuRow(icon: LucideIcons.credit_card, label: 'Default Payment Method', color: const Color(0xFF0891B2)),
          _MenuRow(icon: LucideIcons.history, label: 'Transaction History', color: const Color(0xFF059669)),
          _MenuRow(icon: LucideIcons.receipt, label: 'Statements / Receipts', color: const Color(0xFFF97316)),
        ]);
      default:
        return const SizedBox.shrink();
    }
  }

  // ─────────────────────────────────────────────
  //  AGENT TAB CONTENT
  // ─────────────────────────────────────────────

  Widget _buildAgentTabContent(int index) {
    switch (index) {
      case 0: // Profile & Documents
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.id_card, label: 'Agent ID & Role', color: const Color(0xFF2563EB)),
          _MenuRow(icon: LucideIcons.map_pin, label: 'Assigned Region / Branch', color: const Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.shield_check, label: 'KYC / Certification', color: const Color(0xFF8B5CF6), badge: 'Verified'),
          _MenuRow(icon: LucideIcons.calendar, label: 'Validity / Renewal Dates', color: const Color(0xFFF97316)),
          _MenuRow(icon: LucideIcons.file_pen, label: 'Agent Agreement', color: const Color(0xFF64748B)),
          _MenuRow(icon: LucideIcons.scan_line, label: 'ID Proof / License', color: const Color(0xFF0EA5E9)),
          _MenuRow(icon: LucideIcons.award, label: 'Training Certificates', color: const Color(0xFFF59E0B)),
        ]);
      case 1: // Work & Operations
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.users, label: 'Assigned Customers', color: const Color(0xFF3B82F6), badge: '48'),
          _MenuRow(icon: LucideIcons.clipboard_list, label: 'Pending Tasks', color: const Color(0xFFEF4444), badge: '5'),
          _MenuRow(icon: LucideIcons.target, label: 'Daily / Weekly Targets', color: const Color(0xFF10B981)),
        ]);
      case 2: // Transactions & Services
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.arrow_left_right, label: 'Transactions Performed', color: const Color(0xFF059669)),
          _MenuRow(icon: LucideIcons.hand_coins, label: 'Collections / Disbursements', color: const Color(0xFFD97706)),
          _MenuRow(icon: LucideIcons.history, label: 'Assisted Services History', color: const Color(0xFF64748B)),
          _MenuRow(icon: LucideIcons.building_2, label: 'Banking Services', color: const Color(0xFF2563EB)),
          _MenuRow(icon: LucideIcons.banknote, label: 'Loan Origination', color: const Color(0xFF059669)),
          _MenuRow(icon: LucideIcons.shield, label: 'Insurance Enrollment', color: const Color(0xFFE11D48)),
          _MenuRow(icon: LucideIcons.landmark, label: 'Government Schemes', color: const Color(0xFF0891B2)),
        ]);
      case 3: // Performance & Earnings
        return _buildTabPanel([
          _MenuRow(icon: LucideIcons.gauge, label: 'KPIs / SLAs', color: const Color(0xFF6366F1)),
          _MenuRow(icon: LucideIcons.trophy, label: 'Success Rate', color: const Color(0xFFF59E0B)),
          _MenuRow(icon: LucideIcons.timer, label: 'Turnaround Time', color: const Color(0xFF0EA5E9)),
          _MenuRow(icon: LucideIcons.indian_rupee, label: 'Commission Summary', color: const Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.clock, label: 'Pending vs Paid', color: const Color(0xFFF97316)),
          _MenuRow(icon: LucideIcons.receipt, label: 'Settlement History', color: const Color(0xFF64748B)),
        ]);
      default:
        return const SizedBox.shrink();
    }
  }

  // ─────────────────────────────────────────────
  //  TAB PANEL WRAPPER
  // ─────────────────────────────────────────────

  Widget _buildTabPanel(List<_MenuRow> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          return Column(
            children: [
              _buildMenuItem(item),
              if (i < items.length - 1)
                const Divider(height: 1, indent: 56, endIndent: 16, color: Color(0xFFF0F1F3)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMenuItem(_MenuRow item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(child: Icon(item.icon, size: 15, color: item.color)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF374151),
                    height: 1.3,
                  ),
                ),
              ),
              if (item.badge != null)
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item.badge!,
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: item.color),
                  ),
                ),
              if (item.trailing != null)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Text(
                    item.trailing!,
                    style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF), fontWeight: FontWeight.w500),
                  ),
                ),
              const Icon(Icons.chevron_right_rounded, size: 18, color: Color(0xFFD1D5DB)),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CUSTOMER "MORE" SECTION
  // ─────────────────────────────────────────────

  Widget _buildCustomerMoreSection() {
    return _MoreSection(
      groups: [
        _MoreGroup(title: 'Settings', icon: LucideIcons.settings, iconColor: const Color(0xFF6366F1), items: const [
          _MenuRow(icon: LucideIcons.languages, label: 'Language Selection', color: Color(0xFF6366F1)),
          _MenuRow(icon: LucideIcons.bell, label: 'Notification Preferences', color: Color(0xFFF59E0B)),
          _MenuRow(icon: LucideIcons.map, label: 'Location & Regional Settings', color: Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.sun_moon, label: 'Theme (Light / Dark)', color: Color(0xFF64748B)),
        ]),
        _MoreGroup(title: 'Support', icon: LucideIcons.headset, iconColor: const Color(0xFF10B981), items: const [
          _MenuRow(icon: LucideIcons.ticket, label: 'Raise Support Ticket', color: Color(0xFFEF4444)),
          _MenuRow(icon: LucideIcons.message_circle, label: 'FAQs', color: Color(0xFF0EA5E9)),
          _MenuRow(icon: LucideIcons.headset, label: 'Chat / Call Support', color: Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.bug, label: 'Report an Issue', color: Color(0xFFD97706)),
          _MenuRow(icon: LucideIcons.star, label: 'Feedback & Ratings', color: Color(0xFFF59E0B)),
        ]),
        _MoreGroup(title: 'About', icon: LucideIcons.info, iconColor: const Color(0xFF64748B), items: const [
          _MenuRow(icon: LucideIcons.info, label: 'About CitizenOne', color: Color(0xFF3B82F6)),
          _MenuRow(icon: LucideIcons.sparkles, label: "What's New", color: Color(0xFF8B5CF6)),
          _MenuRow(icon: LucideIcons.smartphone, label: 'App Version', color: Color(0xFF64748B), trailing: 'v1.0.0'),
          _MenuRow(icon: LucideIcons.file_text, label: 'Privacy Policy', color: Color(0xFF475569)),
          _MenuRow(icon: LucideIcons.scale, label: 'Terms & Conditions', color: Color(0xFF475569)),
        ]),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  AGENT "MORE" SECTION
  // ─────────────────────────────────────────────

  Widget _buildAgentMoreSection() {
    return _MoreSection(
      groups: [
        _MoreGroup(title: 'Security', icon: LucideIcons.lock_keyhole, iconColor: const Color(0xFFEF4444), items: const [
          _MenuRow(icon: LucideIcons.lock_keyhole, label: 'Change MPIN / Password', color: Color(0xFFEF4444)),
          _MenuRow(icon: LucideIcons.scan, label: 'Biometric Access', color: Color(0xFF6366F1)),
          _MenuRow(icon: LucideIcons.smartphone, label: 'Device Binding', color: Color(0xFF0284C7)),
          _MenuRow(icon: LucideIcons.monitor_smartphone, label: 'Session History', color: Color(0xFF475569)),
          _MenuRow(icon: LucideIcons.scroll_text, label: 'Activity Logs', color: Color(0xFF64748B)),
          _MenuRow(icon: LucideIcons.map_pinned, label: 'Geo-tagged Transactions', color: Color(0xFF059669)),
          _MenuRow(icon: LucideIcons.file_lock, label: 'Consent Records', color: Color(0xFF7C3AED)),
        ]),
        _MoreGroup(title: 'Settings', icon: LucideIcons.settings, iconColor: const Color(0xFF6366F1), items: const [
          _MenuRow(icon: LucideIcons.languages, label: 'Language', color: Color(0xFF6366F1)),
          _MenuRow(icon: LucideIcons.bell, label: 'Notification Preferences', color: Color(0xFFF59E0B)),
          _MenuRow(icon: LucideIcons.wifi_off, label: 'Offline Mode', color: Color(0xFF64748B)),
          _MenuRow(icon: LucideIcons.refresh_cw, label: 'Sync Status', color: Color(0xFF0EA5E9)),
        ]),
        _MoreGroup(title: 'Help & About', icon: LucideIcons.info, iconColor: const Color(0xFF64748B), items: const [
          _MenuRow(icon: LucideIcons.ticket, label: 'Raise Ticket', color: Color(0xFFEF4444)),
          _MenuRow(icon: LucideIcons.message_circle, label: 'Operational FAQs', color: Color(0xFF0EA5E9)),
          _MenuRow(icon: LucideIcons.book_open, label: 'Training & Manuals', color: Color(0xFF10B981)),
          _MenuRow(icon: LucideIcons.info, label: 'About Agent App', color: Color(0xFF3B82F6)),
          _MenuRow(icon: LucideIcons.smartphone, label: 'App Version', color: Color(0xFF64748B), trailing: 'v1.0.0'),
        ]),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  SMART PROFILE CARD — Identity + Stats Merged, Trust Footer
// ═══════════════════════════════════════════════════════════════════

class _StatChip {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  const _StatChip({required this.icon, required this.value, required this.label, required this.color});
}

class _SmartProfileCard extends StatelessWidget {
  final IconData avatarIcon;
  final List<Color> avatarGradient;
  final String name;
  final String role;
  final String badgeText;
  final Color badgeColor;
  final String benefitHint;
  final String accountId;
  final String lastLogin;
  final String? partner;
  final IconData? partnerIcon;
  final List<_StatChip> stats;

  const _SmartProfileCard({
    required this.avatarIcon,
    required this.avatarGradient,
    required this.name,
    required this.role,
    required this.badgeText,
    required this.badgeColor,
    required this.benefitHint,
    required this.accountId,
    required this.lastLogin,
    this.partner,
    this.partnerIcon,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 14, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          // ── Row 1: Avatar + Identity ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 0),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: avatarGradient,
                    ),
                    boxShadow: [
                      BoxShadow(color: avatarGradient.last.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 3)),
                    ],
                  ),
                  child: Center(child: Icon(avatarIcon, size: 22, color: Colors.white)),
                ),
                const SizedBox(width: 12),
                // Name + Role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF111827), letterSpacing: -0.3, height: 1.2),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle),
                            child: const Icon(Icons.check, size: 8, color: Colors.white),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [badgeColor.withOpacity(0.15), badgeColor.withOpacity(0.06)]),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: badgeColor.withOpacity(0.2)),
                            ),
                            child: Text(
                              badgeText,
                              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w800, color: badgeColor, letterSpacing: 0.6),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$role • $benefitHint',
                        style: TextStyle(fontSize: 11, color: const Color(0xFF6B7280), fontWeight: FontWeight.w500, height: 1.3),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Edit
                Material(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(LucideIcons.pen, size: 14, color: Color(0xFF6B7280)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Trust Footer ──
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: [
                Icon(LucideIcons.hash, size: 11, color: const Color(0xFF9CA3AF)),
                const SizedBox(width: 3),
                Text(accountId, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF), fontWeight: FontWeight.w500)),
                const Spacer(),
                Icon(LucideIcons.clock, size: 11, color: const Color(0xFF9CA3AF)),
                const SizedBox(width: 3),
                Text(lastLogin, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF), fontWeight: FontWeight.w500)),
              ],
            ),
          ),

          // ── Partner (if any) ──
          if (partner != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
              child: Row(
                children: [
                  Icon(partnerIcon ?? LucideIcons.landmark, size: 11, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(partner!, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.primary)),
                ],
              ),
            ),

          // ── Divider ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Divider(height: 1, color: Color(0xFFF0F1F3)),
          ),

          // ── Row 2: Stats Strip ──
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
            child: IntrinsicHeight(
              child: Row(
                children: stats.asMap().entries.map((entry) {
                  final i = entry.key;
                  final s = entry.value;
                  return Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(s.icon, size: 16, color: s.color),
                                    const SizedBox(height: 4),
                                    Text(
                                      s.value,
                                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: s.color, letterSpacing: -0.3),
                                    ),
                                    Text(
                                      s.label,
                                      style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF), fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (i < stats.length - 1)
                          Container(width: 1, margin: const EdgeInsets.symmetric(vertical: 4), color: const Color(0xFFE5E7EB)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  MENU ROW — Used in both tab panels and "More" sections
// ═══════════════════════════════════════════════════════════════════

class _MenuRow {
  final IconData icon;
  final String label;
  final Color color;
  final String? badge;
  final String? trailing;
  const _MenuRow({required this.icon, required this.label, required this.color, this.badge, this.trailing});
}

// ═══════════════════════════════════════════════════════════════════
//  "MORE" SECTION — Grouped accordion for secondary items
// ═══════════════════════════════════════════════════════════════════

class _MoreGroup {
  final String title;
  final IconData icon;
  final Color iconColor;
  final List<_MenuRow> items;
  const _MoreGroup({required this.title, required this.icon, required this.iconColor, required this.items});
}

class _MoreSection extends StatefulWidget {
  final List<_MoreGroup> groups;
  const _MoreSection({required this.groups});

  @override
  State<_MoreSection> createState() => _MoreSectionState();
}

class _MoreSectionState extends State<_MoreSection> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 2)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Section header
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 12, 14, 4),
            child: Row(
              children: [
                Text(
                  'MORE',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF9CA3AF), letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          // Groups
          ...widget.groups.asMap().entries.map((entry) {
            final i = entry.key;
            final g = entry.value;
            final isExpanded = _expandedIndex == i;
            return Column(
              children: [
                // Group header
                Material(
                  color: isExpanded ? const Color(0xFFFAFBFC) : Colors.white,
                  child: InkWell(
                    onTap: () => setState(() => _expandedIndex = isExpanded ? null : i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: g.iconColor.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(child: Icon(g.icon, size: 14, color: g.iconColor)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              g.title,
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1F2937)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '${g.items.length}',
                              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF9CA3AF)),
                            ),
                          ),
                          const SizedBox(width: 6),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 200),
                            child: const Icon(Icons.keyboard_arrow_down_rounded, size: 20, color: Color(0xFF9CA3AF)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Group items
                AnimatedCrossFade(
                  firstChild: const SizedBox(width: double.infinity),
                  secondChild: Column(
                    children: g.items.asMap().entries.map((itemEntry) {
                      final ii = itemEntry.key;
                      final item = itemEntry.value;
                      return Column(
                        children: [
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 12),
                                    Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        color: item.color.withOpacity(0.07),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Center(child: Icon(item.icon, size: 13, color: item.color)),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        item.label,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF374151)),
                                      ),
                                    ),
                                    if (item.trailing != null)
                                      Padding(
                                        padding: const EdgeInsets.only(right: 4),
                                        child: Text(item.trailing!, style: const TextStyle(fontSize: 10, color: Color(0xFF9CA3AF))),
                                      ),
                                    const Icon(Icons.chevron_right_rounded, size: 16, color: Color(0xFFD1D5DB)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (ii < g.items.length - 1)
                            const Divider(height: 1, indent: 64, endIndent: 14, color: Color(0xFFF3F4F6)),
                        ],
                      );
                    }).toList(),
                  ),
                  crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  sizeCurve: Curves.easeInOut,
                ),
                // Divider between groups
                if (i < widget.groups.length - 1)
                  const Divider(height: 1, color: Color(0xFFF0F1F3)),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
//  ACTION BUTTON
// ═══════════════════════════════════════════════════════════════════

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: color, size: 16),
        label: Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: color)),
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          side: BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
