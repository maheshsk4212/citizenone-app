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
    // Determine Theme Colors based on Role
    List<Color> gradientColors;
    Color shadowColor;

    switch (role) {
      case UserRole.agent:
        gradientColors = [const Color(0xFFA855F7), const Color(0xFF7E22CE)]; // Purple
        shadowColor = Colors.purple.withOpacity(0.3);
        break;
      case UserRole.farmer:
        gradientColors = [const Color(0xFF22C55E), const Color(0xFF15803D)]; // Green
        shadowColor = Colors.green.withOpacity(0.3);
        break;
      case UserRole.citizen:
      default:
        gradientColors = [const Color(0xFFEFF6FF), const Color(0xFFDBEAFE)]; // Blue-50
        shadowColor = Colors.blue.withOpacity(0.1);
        break;
    }

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
                color: shadowColor,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: ResponsiveLayout.isDesktop(context)
              ? _DesktopLayout(role: role)
              : _MobileLayout(role: role),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final UserRole role;

  const _MobileLayout({required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderRow(role: role),
          const SizedBox(height: 24),
          _MainValue(role: role),
          const SizedBox(height: 24),
          _ActionButtons(role: role, fullWidth: true),
        ],
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final UserRole role;

  const _DesktopLayout({required this.role});

  @override
  Widget build(BuildContext context) {
    // White text for Agent/Farmer, Black for Citizen
    final isDarkBg = role != UserRole.citizen;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _HeaderRow(role: role),
                const SizedBox(height: 12),
                _MainValue(role: role),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: isDarkBg ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.05),
            margin: const EdgeInsets.symmetric(horizontal: 20),
          ),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ActionButtons(role: role, fullWidth: false),
                const SizedBox(height: 12),
                if (role == UserRole.citizen)
                   Text('Due in 5 days', 
                     style: AppTypography.caption(context).copyWith(
                       color: AppColors.textSecondary,
                       fontSize: 11
                     ),
                     overflow: TextOverflow.ellipsis,
                   ),
                 if (role == UserRole.farmer)
                   Text('Heavy Rain Expected', 
                     style: AppTypography.caption(context).copyWith(
                       color: Colors.white.withOpacity(0.8),
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
  final UserRole role;
  const _HeaderRow({required this.role});

  @override
  Widget build(BuildContext context) {
    final isDarkBg = role != UserRole.citizen;
    
    IconData icon;
    String label;
    
    switch (role) {
      case UserRole.agent:
        icon = LucideIcons.zap;
        label = 'AGENT PERFORMANCE';
        break;
      case UserRole.farmer:
        icon = LucideIcons.cloud;
        label = 'WEATHER ALERT';
        break;
      case UserRole.citizen:
      default:
        icon = LucideIcons.sparkles;
        label = 'CITIZEN AI ALERT';
        break;
    }

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDarkBg ? Colors.white.withOpacity(0.2) : const Color(0xFF2563EB).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 16,
            color: isDarkBg ? Colors.white : AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDarkBg ? Colors.white.withOpacity(0.9) : AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _MainValue extends StatelessWidget {
  final UserRole role;
  const _MainValue({required this.role});

  @override
  Widget build(BuildContext context) {
    final isDarkBg = role != UserRole.citizen;
    final textColor = isDarkBg ? Colors.white : const Color(0xFF1E293B);
    
    if (role == UserRole.agent) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Commission Earned', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text('ZK 450.00', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      );
    }
    
    if (role == UserRole.farmer) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rainfall Alert', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text('Heavy Rain', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 2),
           Text('Expected in 2 days', style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14)),
        ],
      );
    }
    
    // Citizen Default
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
  final UserRole role;
  final bool fullWidth;

  const _ActionButtons({required this.role, required this.fullWidth});

  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [
      if (fullWidth)
        Expanded(child: _PrimaryBtn(role: role))
      else 
        _PrimaryBtn(role: role, width: 160),
        
      const SizedBox(width: 12),
      
      _SecondaryBtn(role: role),
    ];

    if (fullWidth) {
      return Row(children: buttons);
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.end, children: buttons.reversed.toList());
    }
  }
}

class _PrimaryBtn extends StatelessWidget {
  final UserRole role;
  final double? width;
  const _PrimaryBtn({required this.role, this.width});

  @override
  Widget build(BuildContext context) {
    final isDarkBg = role != UserRole.citizen;
    
    String label;
    switch (role) {
      case UserRole.agent: label = 'View Tasks'; break;
      case UserRole.farmer: label = 'View Forecast'; break;
      case UserRole.citizen: default: label = 'Pay Now'; break;
    }

    return SizedBox(
      height: 48,
      width: width,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkBg ? Colors.white : AppColors.primary,
          foregroundColor: isDarkBg ? (role == UserRole.farmer ? const Color(0xFF15803D) : AppColors.primary) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _SecondaryBtn extends StatelessWidget {
  final UserRole role;
  const _SecondaryBtn({required this.role});

  @override
  Widget build(BuildContext context) {
    final isDarkBg = role != UserRole.citizen;
    
    return SizedBox(
      height: 48,
      width: 48,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: BorderSide(color: isDarkBg ? Colors.white.withOpacity(0.3) : Colors.grey.withOpacity(0.3)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: isDarkBg ? Colors.white : AppColors.textSecondary,
        ),
        child: const Icon(LucideIcons.bell, size: 20),
      ),
    );
  }
}
