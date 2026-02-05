import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: themeColor),
            const SizedBox(height: 16),
            Text(heroTitle, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(heroSubtitle),
          ],
        ),
      ),
    );
  }
}
