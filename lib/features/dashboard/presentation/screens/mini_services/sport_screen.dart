import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Sporting & Mental Health',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF0F766E), // teal-700
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF0F766E), Color(0xFF114E45)], // teal-700 to 900
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x4D0F766E), blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Streak',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  '12',
                  style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  'Days',
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Keep it up! Physical health boosts mental wealth.',
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12),
            ),
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(icon: LucideIcons.dumbbell, label: 'Workouts', color: const Color(0xFF10B981)),
        QuickActionItem(icon: LucideIcons.trophy, label: 'Events', color: const Color(0xFFFBBF24)),
        QuickActionItem(icon: LucideIcons.users, label: 'Community', color: const Color(0xFF3B82F6)),
        QuickActionItem(icon: LucideIcons.calendar, label: 'Book', color: const Color(0xFF64748B)),
      ],
      services: [
        ServiceListItem(title: 'Local Sports Facilities', onTap: () {}),
        ServiceListItem(title: 'Mental Wellness Guides', onTap: () {}),
        ServiceListItem(title: 'Meditation Zone', onTap: () {}),
      ],
       aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: const Color(0xFFE0F2FE)), // sky-100
           boxShadow: AppColors.shadowSm,
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text(
               'Wellness Tip',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
             ),
             const SizedBox(height: 8),
             const Text(
               'Try a 10-minute walk after lunch to improve digestion and focus.',
               style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
             ),
             const SizedBox(height: 16),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF2563EB), // blue-600
                   foregroundColor: Colors.white,
                   elevation: 0,
                 ),
                 child: const Text('View Details'),
               ),
             )
           ],
         ),
      ),
    );
  }
}
