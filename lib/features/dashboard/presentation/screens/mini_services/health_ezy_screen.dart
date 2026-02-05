import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class HealthEzyScreen extends StatelessWidget {
  const HealthEzyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'HealthEzy',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF43F5E), // rose-500
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFFF43F5E), Color(0xFFBE123C)], // rose-500 to 700
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(color: Color(0x4DF43F5E), blurRadius: 16, offset: Offset(0, 8)),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health Ezy',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Your Health Passport',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     color: Colors.white.withOpacity(0.2),
                     shape: BoxShape.circle
                   ),
                   child: const Icon(LucideIcons.heart, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildTag('BP: 120/80'),
                const SizedBox(width: 12),
                _buildTag('BMI: 22.4'),
              ],
            )
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(icon: LucideIcons.activity, label: 'Vitals', color: const Color(0xFFF43F5E)),
        QuickActionItem(icon: LucideIcons.pill, label: 'Medicines', color: const Color(0xFF3B82F6)),
        QuickActionItem(icon: LucideIcons.flask_conical, label: 'Lab Tests', color: const Color(0xFFF59E0B)),
        QuickActionItem(icon: LucideIcons.file_text, label: 'Records', color: const Color(0xFF64748B)),
      ],
      services: [
        ServiceListItem(title: 'Symptom Checker', onTap: () {}),
        ServiceListItem(title: 'Vaccination History', onTap: () {}),
        ServiceListItem(title: 'Find Hospitals Nearby', onTap: () {}),
      ],
      aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: const Color(0xFFDBEAFE)), // blue-100
           boxShadow: AppColors.shadowSm,
        ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const Text(
               'Checkup Due',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
             ),
             const SizedBox(height: 8),
             const Text(
               'Annual dental checkup is due next week.',
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
                 child: const Text('Book Appointment'),
               ),
             )
           ],
         ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
