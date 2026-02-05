import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ServicesHubScreen extends StatelessWidget {
  const ServicesHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ALL SERVICES',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF666666),
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 24),
            
            // Services Grid - matching the provided design exactly
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 24,
              childAspectRatio: 0.6,
              children: [
                _ServiceItem(
// ... (I will use multi_replace for this to be cleaner)
                  title: 'Wealth',
                  icon: LucideIcons.circle_dollar_sign,
                  color: const Color(0xFF7C3AED),
                  onTap: () => context.push('/services/wealth'),
                ),
                _ServiceItem(
                  title: 'HealthEzy',
                  icon: LucideIcons.heart,
                  color: const Color(0xFFE91E63),
                  onTap: () => context.push('/services/health'),
                ),
                _ServiceItem(
                  title: 'Sport & Mind',
                  icon: LucideIcons.dumbbell,
                  color: const Color(0xFF14B8A6),
                  onTap: () => context.push('/services/sport'),
                ),
                _ServiceItem(
                  title: 'Bill Pay',
                  icon: LucideIcons.receipt,
                  color: const Color(0xFFF97316),
                  onTap: () => context.push('/services/bills'),
                ),
                _ServiceItem(
                  title: 'Insurance',
                  icon: LucideIcons.shield,
                  color: const Color(0xFFEF4444),
                  onTap: () => context.push('/services/insurance'),
                ),
                _ServiceItem(
                  title: 'Govt Services',
                  icon: LucideIcons.landmark,
                  color: const Color(0xFF3B82F6),
                  onTap: () => context.push('/services/gov'),
                ),
                _ServiceItem(
                  title: 'Common Svcs',
                  icon: LucideIcons.grid_3x3,
                  color: const Color(0xFF3B82F6),
                  onTap: () => context.push('/services/common'),
                ),
                _ServiceItem(
                  title: 'Banking',
                  icon: LucideIcons.building,
                  color: const Color(0xFF3B82F6),
                  onTap: () => context.push('/services/banking'),
                ),
                _ServiceItem(
                  title: 'Mobile Topup',
                  icon: LucideIcons.smartphone,
                  color: const Color(0xFF8B5CF6),
                  onTap: () => context.push('/services/mobile'),
                ),
                _ServiceItem(
                  title: 'Marketplace',
                  icon: LucideIcons.shopping_bag,
                  color: const Color(0xFFEC4899),
                  onTap: () => context.push('/services/market'),
                ),
                _ServiceItem(
                  title: 'Agri Services',
                  icon: LucideIcons.sprout,
                  color: const Color(0xFF10B981),
                  onTap: () => context.push('/services/agri'),
                ),
                _ServiceItem(
                  title: 'Logistics',
                  icon: LucideIcons.truck,
                  color: const Color(0xFFF97316),
                  onTap: () => context.push('/services/logistics'),
                ),
                _ServiceItem(
                  title: 'SME Services',
                  icon: LucideIcons.briefcase,
                  color: const Color(0xFF6366F1),
                  onTap: () => context.push('/services/sme'),
                ),
              ],
            ),
            const SizedBox(height: 80), // Bottom padding for nav bar
          ],
        ),
      ),
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ServiceItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
              height: 1.3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
