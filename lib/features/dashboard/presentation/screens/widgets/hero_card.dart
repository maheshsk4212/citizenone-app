import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/core/design_system/responsive.dart';
import 'package:citizenone_app/core/design_system/tokens/typography.dart';

class HeroCard extends StatelessWidget {
  final UserRole role;

  const HeroCard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Agent Theme: Purple
    final bool isAgent = role == UserRole.agent;
    final List<Color> gradientColors = isAgent
        ? [const Color(0xFFA855F7), const Color(0xFF7E22CE)] // Purple
        : [const Color(0xFFEFF6FF), const Color(0xFFDBEAFE)]; // Blue-50

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: ResponsiveLayout.isDesktop(context) ? double.infinity : 800),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: isAgent ? Colors.purple.withOpacity(0.3) : Colors.blue.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: ResponsiveLayout.isDesktop(context)
              ? _DesktopLayout(role: role, isAgent: isAgent)
              : _MobileLayout(role: role, isAgent: isAgent),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final UserRole role;
  final bool isAgent;

  const _MobileLayout({required this.role, required this.isAgent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderRow(isAgent: isAgent),
          const SizedBox(height: 24),
          _MainValue(isAgent: isAgent),
          const SizedBox(height: 24),
          _ActionButtons(isAgent: isAgent, fullWidth: true),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final UserRole role;
  final bool isAgent;

  const _DesktopLayout({required this.role, required this.isAgent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20), // Reduced padding
      child: Row(
        children: [
          Expanded(
            flex: 4, // Increased emphasis on main value
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _HeaderRow(isAgent: isAgent),
                const SizedBox(height: 12),
                _MainValue(isAgent: isAgent),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: isAgent ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.05),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          Flexible( // Changed from Expanded to Flexible
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ActionButtons(isAgent: isAgent, fullWidth: false),
                 const SizedBox(height: 12),
                 if (!isAgent)
                   Text('Due in 5 days', 
                     style: AppTypography.caption(context).copyWith(
                       color: AppColors.textSecondary,
                       fontSize: 11
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  final bool isAgent;
  const _HeaderRow({required this.isAgent});

  @override
  Widget build(BuildContext context) {
    final Color textColor = isAgent ? Colors.white : AppColors.textPrimary;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isAgent ? Colors.white.withOpacity(0.2) : const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            isAgent ? LucideIcons.zap : LucideIcons.sparkles,
            size: 16,
            color: isAgent ? Colors.white : AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          isAgent ? 'AGENT PERFORMANCE' : 'CITIZEN AI ALERT',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isAgent ? Colors.white.withOpacity(0.9) : AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _MainValue extends StatelessWidget {
  final bool isAgent;
  const _MainValue({required this.isAgent});

  @override
  Widget build(BuildContext context) {
    final Color textColor = isAgent ? Colors.white : const Color(0xFF1E293B);
    
    if (isAgent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Commission Earned', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text('ZK 450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      );
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Electricity Bill Due', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('ZK', style: TextStyle(color: AppColors.textSecondary, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            Text('450.00', style: TextStyle(color: textColor, fontSize: 36, fontWeight: FontWeight.w800, letterSpacing: -1)),
          ],
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final bool isAgent;
  final bool fullWidth;

  const _ActionButtons({required this.isAgent, required this.fullWidth});

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [
      if (fullWidth)
        Expanded(child: _PrimaryBtn(isAgent: isAgent))
      else 
        _PrimaryBtn(isAgent: isAgent, width: 160),
        
      const SizedBox(width: 12),
      
      _SecondaryBtn(isAgent: isAgent),
    ];

    if (fullWidth) {
      return Row(children: buttons);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: buttons.reversed.toList());
    }
  }
}

class _PrimaryBtn extends StatelessWidget {
  final bool isAgent;
  final double? width;
  const _PrimaryBtn({required this.isAgent, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isAgent ? Colors.white : AppColors.primary,
          foregroundColor: isAgent ? AppColors.primary : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(isAgent ? 'View Tasks' : 'Pay Now', style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _SecondaryBtn extends StatelessWidget {
  final bool isAgent;
  const _SecondaryBtn({required this.isAgent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 48,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: BorderSide(color: isAgent ? Colors.white.withOpacity(0.3) : Colors.grey.withOpacity(0.3)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: isAgent ? Colors.white : AppColors.textSecondary,
        ),
        child: const Icon(LucideIcons.bell, size: 20),
      ),
    );
  }
}
