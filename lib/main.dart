// Force reload
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/core/theme/app_theme.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:citizenone_app/core/routing/router.dart';

void main() {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: CitizenOneApp()));
}

class CitizenOneApp extends StatelessWidget {
  const CitizenOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CitizenOne-app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}
