import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_lucide/flutter_lucide.dart'; // Use Lucide for thinner, cleaner icons

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    
    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFEF3C7), // Light amber/gold-ish based on screenshot skin tone/bg
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.face_3_rounded, // Retaining this as it's a good specific avatar icon availability
                  size: 64,
                  color: const Color(0xFF92400E), 
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Customer',
              style: TextStyle(
                fontSize: 20, // Reduced to 20px
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Gold Member • Lusaka',
              style: TextStyle(
                fontSize: 13, // Reduced to 13px
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 48),
            
            // Sections
            _buildSectionHeader('ACCOUNT'),
            const SizedBox(height: 12),
            _buildMenuCard([
              _buildMenuItem(
                icon: Icons.person_outline,
                title: 'Personal Information',
                onTap: () {},
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: Color(0xFFF3F4F6)), // Very light grey (gray-100)
              _buildMenuItem(
                icon: Icons.shield_outlined,
                title: 'Security & Privacy',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 32),
            
            _buildSectionHeader('SETTINGS'),
            const SizedBox(height: 12),
            _buildMenuCard([
              _buildMenuItem(
                icon: Icons.settings_outlined,
                title: 'App Settings',
                onTap: () {},
              ),
              const Divider(height: 1, indent: 60, endIndent: 20, color: Color(0xFFF3F4F6)),
              _buildMenuItem(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 40),
            
            // Log Out Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: ElevatedButton.icon(
                onPressed: () => context.go('/login'),
                icon: const Icon(Icons.logout, color: Color(0xFFEF4444), size: 18),
                label: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF4444),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF2F2),
                  foregroundColor: const Color(0xFFEF4444),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Tighter radius
                  ),
                ),
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12, // Slightly smaller caps
            fontWeight: FontWeight.w700,
            color: Colors.grey[500],
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Reduced from 24
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8, // Reduced from 16
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)), // Added subtle border for crispness
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Tighter padding
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: Colors.grey[600], size: 22), // Reduced size
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15, // Reduced from 17
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500, // Reduced weight slightly
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[300], size: 24),
          ],
        ),
      ),
    );
  }
}
