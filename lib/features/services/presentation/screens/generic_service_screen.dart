import 'package:flutter/material.dart';
import 'package:citizenone_app/core/common/widgets/mini_service_scaffold.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class GenericServiceScreen extends StatelessWidget {
  final String title;
  final String heroTitle;
  final String heroSubtitle;
  final Color themeColor;

  const GenericServiceScreen({
    super.key,
    required this.title,
    required this.heroTitle,
    required this.heroSubtitle,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return MiniServiceScaffold(
      title: title,
      hero: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: themeColor,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [themeColor, themeColor.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(color: themeColor.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heroTitle,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              heroSubtitle,
              style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
            ),
             const SizedBox(height: 16),
             ElevatedButton(
               onPressed: () {},
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white,
                 foregroundColor: themeColor,
                 elevation: 0,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
               ),
               child: const Text('Get Started'),
             )
          ],
        ),
      ),
      quickActions: [
        QuickActionData(icon: LucideIcons.search, label: 'Search', color: themeColor),
        QuickActionData(icon: LucideIcons.history, label: 'History', color: themeColor),
        QuickActionData(icon: LucideIcons.settings, label: 'Settings', color: themeColor),
        QuickActionData(icon: Icons.help_outline, label: 'Help', color: Colors.grey),
      ],
      services: [
        ServiceListData(title: 'Service Option 1', onTap: () {}),
        ServiceListData(title: 'Service Option 2', onTap: () {}),
        ServiceListData(title: 'Support & FAQs', onTap: () {}),
      ],
      aiInsight: null, // No AI for generic yet
    );
  }
}
