import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/core/common/widgets/glass_container.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class ContextSelectionSheet extends ConsumerWidget {
  const ContextSelectionSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentRole = ref.watch(authProvider).selectedRole;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Select Context',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildRoleOption(
                context,
                ref,
                role: UserRole.citizen,
                isSelected: currentRole == UserRole.citizen,
                icon: Icons.person_outline,
                title: 'Citizen',
                description: 'Access personal services and applications',
              ),
              const SizedBox(height: 16),
              _buildRoleOption(
                context,
                ref,
                role: UserRole.agent,
                isSelected: currentRole == UserRole.agent,
                icon: Icons.business_center_outlined,
                title: 'Service Agent',
                description: 'Manage applications and help citizens',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleOption(
    BuildContext context,
    WidgetRef ref, {
    required UserRole role,
    required bool isSelected,
    required IconData icon,
    required String title,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        ref.read(authProvider.notifier).setRole(role);
        context.pop(); // Close sheet after selection
      },
      child: GlassContainer(
        color: isSelected ? AppColors.primary.withOpacity(0.2) : AppColors.surfaceLight.withOpacity(0.5),
        border: isSelected ? Border.all(color: AppColors.primary, width: 2) : null,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white.withOpacity(0.8) : AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.success),
          ],
        ),
      ),
    );
  }
}
