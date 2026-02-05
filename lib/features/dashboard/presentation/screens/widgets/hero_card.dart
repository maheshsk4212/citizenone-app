import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/core/design_system/tokens/colors.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class HeroCard extends StatelessWidget {
  final UserRole role;

  const HeroCard({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Container(
          // relative overflow-hidden border-none bg-indigo-50/80 ... shadow-sm ring-1 ring-inset ring-indigo-100
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFF0F4FF).withOpacity(0.9), // Very light indigo
                const Color(0xFFE0E7FF).withOpacity(0.9), // Indigo 100
              ],
            ),
            borderRadius: BorderRadius.circular(24), // More rounded
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4F46E5).withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              // Soft decorative background (Top Right)
              Positioned(
                top: -60,
                right: -60,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(color: Colors.white, blurRadius: 40) // Glow
                      ]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
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
                                color: const Color(0xFFE0E7FF), // indigo-100
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(LucideIcons.sparkles,
                                  size: 16,
                                  color: Color(0xFF4F46E5)), // indigo-600
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'CITIZEN AI ALERT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E1B4B), // indigo-950
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        if (role == UserRole.agent)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F46E5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'AGENT MODE',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Role Specific Content
                    if (role == UserRole.citizen) ...[
                      // New Layout: Title row, Large Amount, Action Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Electricity Bill Due',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4B5563))), // Gray-600
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEF2F2), // red-50
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: const Color(0xFFFECACA)), // red-200
                            ),
                            child: const Text('Due tomorrow',
                                style: TextStyle(
                                    color: Color(0xFFDC2626),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text('ZK 450.00',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF111827),
                              letterSpacing: -1.0)), // Gray-900
                      const SizedBox(height: 24),
                      Row(children: [
                        Expanded(
                            flex: 2,
                            child: _buildActionButton(
                                'Pay Now', LucideIcons.arrow_right)),
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
                    ] else if (role == UserRole.agent) ...[
                      const Text('3 Tasks Pending',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary)),
                      const SizedBox(height: 8),
                      const Text('2 new onboardings • 1 collection nearby',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 16),
                      _buildActionButton('View Tasks', LucideIcons.arrow_right),
                    ]
                    // Add Farmer logic if needed later
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
