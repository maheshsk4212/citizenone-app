import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class AISmartSection extends StatelessWidget {
  final UserRole role;

  const AISmartSection({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Define the insights variable here so it's available in the closure
    final insights = _getInsights(role);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: insights.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return _buildInsightCard(insights[index]);
          },
        ),
      ],
    );
  }

  Widget _buildInsightCard(_Insight insight) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
             Colors.white,
             const Color(0xFFF0F9FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0F2FE)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE0F2FE).withOpacity(0.5),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               Container(
                 padding: const EdgeInsets.all(8),
                 decoration: BoxDecoration(
                   color: const Color(0xFFE0F2FE),
                   shape: BoxShape.circle,
                 ),
                 child: Icon(LucideIcons.sparkles, size: 16, color: const Color(0xFF0284C7)),
               ),
               const SizedBox(width: 12),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Money Snapshot', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                   Text('AI-Powered Analysis', style: TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                 ],
               ),
               const Spacer(),
               Container(
                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 decoration: BoxDecoration(
                    color: const Color(0xFF0284C7),
                    borderRadius: BorderRadius.circular(20),
                 ),
                 child: const Text('Ask AI', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
               )
            ],
          ),
          const SizedBox(height: 16),
          // Content
          _buildBulletItem(insight.title), // "Eligible for 15L loan"
          const SizedBox(height: 8),
          _buildBulletItem(insight.desc), // "2 better offers"
        ],
      ),
    );
  }

  Widget _buildBulletItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Align to top for multi-line
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0), // Visual alignment
          child: Icon(Icons.check_circle, size: 16, color: Color(0xFF10B981)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.textPrimary, height: 1.4)),
        ),
      ],
    );
  }

  List<_Insight> _getInsights(UserRole role) {
    if (role == UserRole.agent) {
       return [
         _Insight(1, 'High Demand Area', 'Sector 4 has 15 merchants waiting for onboarding.', 'View Map', const Color(0xFF7C3AED), const Color(0xFFF3E8FF)),
         _Insight(2, 'Pending Collections', '3 merchants have skipped payment this week.', 'View List', const Color(0xFFF97316), const Color(0xFFFFEDD5)),
       ];
    }
    // Customer default
    return [
       _Insight(1, 'You are eligible for up to ₹15L personal loan', 'We found 2 better offers for you based on your credit score.', null, const Color(0xFFEF4444), const Color(0xFFFEF2F2)),
    ];
  }
}

class _Insight {
  final int id;
  final String title;
  final String desc;
  final String? action;
  final Color color;
  final Color bg;

  _Insight(this.id, this.title, this.desc, this.action, this.color, this.bg);
}
