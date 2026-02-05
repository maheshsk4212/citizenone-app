import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/features/auth/presentation/widgets/context_toggle.dart';

import 'package:citizenone_app/core/design_system/responsive.dart'; // Import Responsive Utilities

class AppShell extends ConsumerWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(authProvider).selectedRole;
    final location = GoRouterState.of(context).uri.toString();
    final isDesktop = ResponsiveLayout.isDesktop(context);

    // Common Header (Mobile/Tablet only - Desktop has it in side rail or separate)
    
    // Hide header on specific service pages that have their own back button/header
    final bool hideHeader = location.startsWith('/services/') && location != '/services';

    return Scaffold(
      extendBody: !isDesktop, // Only floating nav needs this
      backgroundColor: AppColors.background,
      appBar: (!isDesktop && !hideHeader)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: _buildGlassHeader(context, ref, role),
            )
          : null, // Custom desktop layout handles header
      body: isDesktop
          ? Row(
              children: [
                _buildSideNavRail(context, location, ref, role),
                Expanded(
                  child: Column(
                    children: [
                      // Desktop Header
                      Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             const Text('Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                             // Re-use header logic or simplified profile
                             Row(
                               children: [
                                 Text(role.displayName, style: const TextStyle(fontWeight: FontWeight.bold)),
                                 const SizedBox(width: 12),
                                 const CircleAvatar(backgroundColor: AppColors.primary, child: Icon(Icons.person, color: Colors.white)),
                               ],
                             )
                          ],
                        ),
                      ),
                      Expanded(child: child),
                    ],
                  ),
                ),
              ],
            )
          : child,
      bottomNavigationBar: !isDesktop 
          ? _buildFloatingBottomNav(context, location) 
          : null,
    );
  }

  Widget _buildGlassHeader(BuildContext context, WidgetRef ref, UserRole role) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Glass
        border: const Border(bottom: BorderSide(color: Colors.white)),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        boxShadow: AppColors.shadowSm,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (role == UserRole.agent) ...[
                   const ContextToggle(),
                ] else ...[
                   GestureDetector(
                    onTap: () {
                       // TODO: Open Profile/Menu
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: AppColors.shadowSm,
                      ),
                      child: ClipOval(
                        child: Center(child: Text(role.displayName[0], style: const TextStyle(fontWeight: FontWeight.bold))),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Good Morning', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.location_on, size: 10, color: AppColors.textSecondary),
                            SizedBox(width: 2),
                            Text('Lusaka', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]
              ],
            ),
            // Role Selector
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: IntrinsicWidth(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<UserRole>(
                    value: role,
                    isDense: true,
                    icon: const Icon(Icons.keyboard_arrow_down, size: 16, color: AppColors.textSecondary),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textMain),
                    onChanged: (UserRole? newRole) {
                      if (newRole != null) {
                        ref.read(authProvider.notifier).setRole(newRole);
                      }
                    },
                    items: UserRole.values.map((UserRole r) {
                      return DropdownMenuItem<UserRole>(
                        value: r,
                        child: Text(r.displayName),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideNavRail(BuildContext context, String currentLocation, WidgetRef ref, UserRole role) {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 32),
          // App Logo or Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Icon(Icons.shield, size: 32, color: AppColors.primary),
                SizedBox(width: 12),
                Text('Citizen One', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 48),
          
          _SideNavItem(icon: Icons.home_filled, label: 'Home', isActive: currentLocation == '/home', onTap: () => context.go('/home')),
          _SideNavItem(icon: Icons.grid_view_rounded, label: 'Services', isActive: currentLocation.startsWith('/services'), onTap: () => context.push('/services')),
          _SideNavItem(icon: Icons.notifications_none_rounded, label: 'Alerts', isActive: currentLocation == '/notifications', onTap: () => context.push('/notifications')),
          _SideNavItem(icon: Icons.person_outline_rounded, label: 'Profile', isActive: currentLocation == '/profile', onTap: () => context.push('/profile')),
          
          const Spacer(),
          // Logout or Settings
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text('v1.0.0', style: TextStyle(color: Colors.grey)),
          )
        ],
      ),
    );
  }

  Widget _buildFloatingBottomNav(BuildContext context, String currentLocation) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Container(
          height: 88,
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _NavBarItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                label: 'Home',
                isActive: currentLocation == '/home',
                onTap: () => context.go('/home'),
              ),
              _NavBarItem(
                icon: Icons.grid_view_rounded,
                activeIcon: Icons.grid_view_rounded,
                label: 'Services',
                isActive: currentLocation.startsWith('/services') || currentLocation == '/explore',
                onTap: () => context.go('/services'),
              ),
              
              // Central Pay FAB
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                       // context.push('/services/pay'); // TODO: Add pay route
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB), // Blue-600
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF2563EB).withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Pay',
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                ],
              ),

              _NavBarItem(
                icon: Icons.notifications_none_outlined,
                activeIcon: Icons.notifications,
                label: 'Alerts',
                isActive: currentLocation == '/notifications',
                onTap: () => context.go('/notifications'),
              ),
              _NavBarItem(
                icon: Icons.person_outline,
                activeIcon: Icons.person,
                label: 'Profile',
                isActive: currentLocation == '/profile',
                onTap: () => context.go('/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SideNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _SideNavItem({required this.icon, required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.primary : AppColors.textMuted),
      title: Text(label, style: TextStyle(color: isActive ? AppColors.primary : AppColors.textMuted, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      selected: isActive,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: isActive ? AppColors.primary.withOpacity(0.1) : null,
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? const Color(0xFF2563EB) : const Color(0xFF9CA3AF), // Blue-600 : Gray-400
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF2563EB) : const Color(0xFF9CA3AF),
                fontSize: 11,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
