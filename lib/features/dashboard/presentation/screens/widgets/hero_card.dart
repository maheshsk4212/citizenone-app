import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class HeroCard extends StatelessWidget {
  final UserRole role;

  const HeroCard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    // Agent Theme: Purple
    final bool isAgent = role == UserRole.agent;
    final Color primaryColor = isAgent ? const Color(0xFF9333EA) : const Color(0xFF4F46E5); // Purple vs Indigo
    final List<Color> gradientColors = isAgent 
        ? [const Color(0xFFA855F7), const Color(0xFF7E22CE)] // Purple 500-700
        : [const Color(0xFFF0F4FF).withOpacity(0.9), const Color(0xFFE0E7FF).withOpacity(0.9)];
    
    // For text colors on colored background (Agent) vs light background (Citizen)
    final Color textColor = isAgent ? Colors.white : const Color(0xFF1E1B4B);
    final Color subTextColor = isAgent ? Colors.white.withOpacity(0.8) : const Color(0xFF6B7280);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Decorative background
              Positioned(
                top: -60,
                right: -60,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(isAgent ? 0.1 : 0.4),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.white.withOpacity(isAgent ? 0.05 : 1.0), blurRadius: 40)
                      ]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: isAgent ? Colors.white.withOpacity(0.2) : const Color(0xFFE0E7FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                isAgent ? LucideIcons.zap : LucideIcons.sparkles,
                                size: 16,
                                color: isAgent ? Colors.white : const Color(0xFF4F46E5),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isAgent ? 'AGENT PERFORMANCE' : 'CITIZEN AI ALERT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: isAgent ? Colors.white.withOpacity(0.2) : const Color(0xFFFEF2F2),
                            borderRadius: BorderRadius.circular(20),
                            border: isAgent ? null : Border.all(color: const Color(0xFFFECACA)),
                          ),
                          child: Text(
                            isAgent ? 'Today' : 'Due tomorrow',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: isAgent ? Colors.white : const Color(0xFFDC2626),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Role Specific Content
                    if (isAgent) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Commission',
                                style: TextStyle(color: subTextColor, fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'ZK 450',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(width: 1, height: 40, color: Colors.white.withOpacity(0.2)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tasks',
                                style: TextStyle(color: subTextColor, fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(text: '3', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                                    TextSpan(text: ' / 5', style: TextStyle(fontSize: 18, color: Colors.white70)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10), // Spacing
                        ],
                      ),
                    ] else ...[
                      // Citizen Layout
                      const Text('Electricity Bill Due',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4B5563))),
                      const SizedBox(height: 8),
                      const Text('ZK 450.00',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF111827),
                              letterSpacing: -1.0)),
                      const SizedBox(height: 24),
                      Row(children: [
                        Expanded(
                            flex: 2,
                            child: _buildActionButton('Pay Now', LucideIcons.arrow_right)),
                        const SizedBox(width: 16),
                        const Expanded(
                          flex: 1,
                          child: Center(
                            child: Text('Remind later',
                                style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14)),
                          ),
                        )
                      ]),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF4F46E5), // indigo-600
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Color(0x334F46E5), blurRadius: 10, offset: Offset(0, 4)), // shadow-indigo-200 equivalentish
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
