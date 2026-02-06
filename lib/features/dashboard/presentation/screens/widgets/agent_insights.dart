import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/core/design_system/tokens/dimensions.dart';

class AgentInsights extends StatelessWidget {
  const AgentInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(LucideIcons.sparkles, size: 16, color: Color(0xFF9333EA)), // Purple
            const SizedBox(width: 8),
            const Text(
              'CITIZEN AI INSIGHTS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Color(0xFF7E22CE), // Purple-700
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildInsightCard(
          context: context,
          title: 'High Demand Area',
          description: 'Sector 4 has 15 merchants waiting for onboarding.',
          buttonText: 'View Map',
          icon: LucideIcons.map, // Map icon
          isPurple: true,
        ),
        const SizedBox(height: 16),
        _buildInsightCard(
          context: context,
          title: 'Pending Collections',
          description: '3 merchants have skipped payment this week.',
          buttonText: 'View List',
          icon: LucideIcons.list_ordered,
          isPurple: true,
        ),
      ],
    );
  }

  Widget _buildInsightCard({
    required BuildContext context,
    required String title,
    required String description,
    required String buttonText,
    required IconData icon,
    bool isPurple = false,
  }) {
    final Color primaryColor = isPurple ? const Color(0xFF4F46E5) : const Color(0xFF4B5563);
    final Color lightBg = isPurple ? const Color(0xFFEEF2FF) : Colors.white;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Slight gray bg
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
              children: [
                const Icon(LucideIcons.sparkles, size: 12, color: Color(0xFFA855F7)), // Purple sparkle
                const SizedBox(width: 6),
                const Text(
                  'CITIZEN AI ALERT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B7280),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
           ),
           const SizedBox(height: 8),
           Text(
             title,
             style: const TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: AppColors.textPrimary,
             ),
           ),
           const SizedBox(height: 4),
           Text(
             description,
             style: const TextStyle(
               fontSize: 14,
               color: AppColors.textSecondary,
               height: 1.4,
             ),
           ),
           const SizedBox(height: 16),
           SizedBox(
             width: double.infinity,
             height: 44,
             child: ElevatedButton(
               onPressed: () {},
               style: ElevatedButton.styleFrom(
                 backgroundColor: const Color(0xFF4F46E5), // Indigo button
                 foregroundColor: Colors.white,
                 elevation: 0,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
                   const SizedBox(width: 8),
                   const Icon(LucideIcons.arrow_right, size: 16),
                 ],
               ),
             ),
           ),
        ],
      ),
    );
  }
}
