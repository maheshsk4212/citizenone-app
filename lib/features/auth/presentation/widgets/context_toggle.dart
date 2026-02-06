import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
// Assuming AuthProvider manages workContext or we need a new provider?
// The backup uses useRole(). workContext is part of role context.
// In our Flutter app, AuthState has selectedRole. We might need to add workContext to AuthState.

class ContextToggle extends ConsumerWidget {
  const ContextToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeContext = ref.watch(authProvider).workContext;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOption(
            'CitizenOne', 
            LucideIcons.users, 
            activeContext == 'CitizenOne', 
            () => ref.read(authProvider.notifier).setWorkContext('CitizenOne')
          ),
          _buildOption(
            'Partner', 
            LucideIcons.briefcase, 
            activeContext == 'Partner', 
            () => ref.read(authProvider.notifier).setWorkContext('Partner')
          ),
        ],
      ),
    );
  }

  Widget _buildOption(String label, IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0F172A) : Colors.transparent, // slate-900
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive ? [const BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))] : [],
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: isActive ? Colors.white : Colors.grey[600]),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
