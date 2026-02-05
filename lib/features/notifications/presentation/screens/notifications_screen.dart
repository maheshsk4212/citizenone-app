import 'package:flutter/material.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alerts & Notifications',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 32),
            _buildNotificationCard(
              icon: Icons.receipt_long,
              iconBg: const Color(0xFFFFEBEE),
              iconColor: const Color(0xFFEF4444),
              title: 'Electricity Bill Due',
              description: 'Your bill of ZK 450.00 is due tomorrow. Pay now to avoid late fees.',
              time: '2 hours ago',
            ),
            const SizedBox(height: 16),
            _buildNotificationCard(
              icon: Icons.security_rounded,
              iconBg: const Color(0xFFFFF3E0),
              iconColor: const Color(0xFFF97316),
              title: 'New Login Detected',
              description: 'Login from new device (iPhone 13) in Lusaka.',
              time: '5 hours ago',
            ),
            const SizedBox(height: 16),
            _buildNotificationCard(
              icon: Icons.auto_awesome,
              iconBg: const Color(0xFFF3E8FF),
              iconColor: const Color(0xFF7C3AED),
              title: 'Smart Insight',
              description: 'You spent 15% less on groceries this week compared to last month. Great job!',
              time: 'Yesterday',
            ),
            const SizedBox(height: 16),
            _buildNotificationCard(
              icon: Icons.notifications_active_rounded,
              iconBg: const Color(0xFFDCFCE7),
              iconColor: const Color(0xFF10B981),
              title: 'Payment Received',
              description: 'Received ZK 5,000.00 from John Doe via Wallet.',
              time: 'Yesterday',
            ),
            const SizedBox(height: 120), // Extra space for FAB and navigation
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String description,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
