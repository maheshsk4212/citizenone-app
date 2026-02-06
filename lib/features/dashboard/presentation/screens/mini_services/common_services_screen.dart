import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';

class CommonServicesScreen extends StatelessWidget {
  const CommonServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: 'Common Services',
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B), // Slate-800
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'System Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildMetric('99.9%', 'UPTIME', const Color(0xFF22C55E)), // Green-500
                const SizedBox(width: 24),
                _buildMetric('12ms', 'LATENCY', const Color(0xFF3B82F6)), // Blue-500
              ],
            ),
          ],
        ),
      ),
      quickActions: [
        QuickActionItem(
          icon: Icons.bar_chart,
          label: 'Analytics',
          backgroundColor: const Color(0xFFF3F4F6), // Gray-100
          iconColor: const Color(0xFF4B5563), // Gray-600
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.message_square,
          label: 'Tickets',
          backgroundColor: const Color(0xFFDBEAFE), // Blue-100
          iconColor: const Color(0xFF2563EB), // Blue-600
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.layout_grid,
          label: 'Admin',
          backgroundColor: const Color(0xFFF3E8FF), // Purple-100
          iconColor: const Color(0xFF9333EA), // Purple-600
          onTap: () {},
        ),
        QuickActionItem(
          icon: LucideIcons.headphones,
          label: 'Support',
          backgroundColor: const Color(0xFFDCFCE7), // Green-100
          iconColor: const Color(0xFF16A34A), // Green-600
          onTap: () {},
        ),
      ],
      services: [
        ServiceListItem(title: 'Service Logs', onTap: () {}),
        ServiceListItem(title: 'User Management', onTap: () {}),
        ServiceListItem(title: 'Security Controls', onTap: () {}),
      ],
      aiInsight: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE0F2FE)), // light blue
          boxShadow: AppColors.shadowSm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(LucideIcons.sparkles, size: 16, color: Color(0xFF3B82F6)),
                SizedBox(width: 8),
                Text(
                  'CITIZEN AI ALERT',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Performance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'System load is normal. No incidents reported.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // Blue-600
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('View Details', style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMetric(String value, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
