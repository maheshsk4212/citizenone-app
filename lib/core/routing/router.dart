import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:citizenone_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:citizenone_app/features/auth/presentation/screens/login_screen.dart';
import 'package:citizenone_app/core/common/widgets/app_shell.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/super_home_screen.dart';
// import 'package:citizenone_app/features/dashboard/presentation/screens/banking_dashboard_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loans_dashboard_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loan_journey_screens.dart';
import 'package:citizenone_app/features/ai_assistant/presentation/screens/ai_assistant_screen.dart';
import 'package:citizenone_app/features/services/presentation/screens/services_hub_screen.dart';
import 'package:citizenone_app/features/services/presentation/screens/service_screens.dart';
import 'package:citizenone_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:citizenone_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/sport_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/health_ezy_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/wealth_management_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/bill_pay_screen.dart';
import 'package:citizenone_app/core/common/widgets/service_placeholder_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/home', // Skip splash for dev speed, or keep '/'
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const SuperHomeScreen(),
        ),
        GoRoute(
          path: '/explore',
          builder: (context, state) => const ServicePlaceholderScreen(title: 'Explore Financial Products'),
        ),
        GoRoute(
          path: '/ai-assistant',
          builder: (context, state) => const AIAssistantScreen(),
        ),
        GoRoute(
          path: '/activity',
          builder: (context, state) => const ServicePlaceholderScreen(title: 'Activity'),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        
        // --- Loan Journey Routes ---
        GoRoute(
          path: '/loans',
          builder: (context, state) => const LoansDashboardScreen(),
           routes: [
             GoRoute(
               path: 'eligibility',
                builder: (context, state) => const LoanEligibilityScreen(),
             ),
             GoRoute(
               path: 'recommendation',
                builder: (context, state) => const AILoanRecommendationScreen(),
             ),
             GoRoute(
               path: 'compare',
                builder: (context, state) => const LoanComparisonScreen(),
             ),
             GoRoute(
               path: 'apply',
                builder: (context, state) => const LoanApplicationScreen(),
             ),
             GoRoute(
               path: 'status',
                builder: (context, state) => const LoanStatusScreen(),
             ),
           ]
        ),
        
        // --- Services (Migrated) ---
         GoRoute(
          path: '/services',
          builder: (context, state) => const ServicesHubScreen(),
        ),
         GoRoute(
          path: '/notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        // --- Full Service Routes ---
        GoRoute(
          path: '/services/bills',
          builder: (context, state) => const BillPayScreen(),
        ),
        GoRoute(
          path: '/services/wallet',
          builder: (context, state) => const GenericServiceScreen(
            title: 'Digital Wallet', 
            heroTitle: 'My Wallet', 
            heroSubtitle: 'Manage your cards and balance', 
            themeColor: Color(0xFF8B5CF6) // violet-500
          ),
        ),
        GoRoute(
          path: '/services/agri',
          builder: (context, state) => const GenericServiceScreen(
            title: 'Agri Services', 
            heroTitle: 'Farm Connect', 
            heroSubtitle: 'Market prices and crop advisory', 
            themeColor: Color(0xFF16A34A) // green-600
          ),
        ),
        GoRoute(
          path: '/services/logistics',
          builder: (context, state) => const GenericServiceScreen(
            title: 'Logistics', 
            heroTitle: 'Track & Ship', 
            heroSubtitle: 'Reliable delivery network', 
            themeColor: Color(0xFFEA580C) // orange-600
          ),
        ),
        GoRoute(
          path: '/services/sme',
          builder: (context, state) => const GenericServiceScreen(
            title: 'SME Services', 
            heroTitle: 'Business Hub', 
            heroSubtitle: 'Tools for your enterprise', 
            themeColor: Color(0xFF2563EB) // blue-600
          ),
        ),
        GoRoute(
          path: '/services/market',
           builder: (context, state) => const GenericServiceScreen(
             title: 'Marketplace', 
             heroTitle: 'Shop Local', 
             heroSubtitle: 'Discover products near you', 
             themeColor: Color(0xFFDB2777) // pink-600
           ),
        ),
        GoRoute(
          path: '/services/insurance',
           builder: (context, state) => const GenericServiceScreen(
             title: 'Insurance', 
             heroTitle: 'Protection Plans', 
             heroSubtitle: 'Life, Auto & Health Coverage', 
             themeColor: Color(0xFFEF4444) // red-500
           ),
        ),
        GoRoute(
          path: '/services/gov',
           builder: (context, state) => const GenericServiceScreen(
             title: 'Gov Services', 
             heroTitle: 'Citizen Portal', 
             heroSubtitle: 'Access public services easily', 
             themeColor: Color(0xFF0D9488) // teal-600
           ),
        ),
        GoRoute(
          path: '/services/common',
           builder: (context, state) => const GenericServiceScreen(
             title: 'Common Services', 
             heroTitle: 'Utility Hub', 
             heroSubtitle: 'Everyday essential services', 
             themeColor: Color(0xFF4F46E5) // indigo-600
           ),
        ),
        GoRoute(
          path: '/services/wealth',
           builder: (context, state) => const WealthManagementScreen(),
        ),
        GoRoute(
          path: '/services/health',
           builder: (context, state) => const HealthEzyScreen(),
        ),
        GoRoute(
          path: '/services/sport',
           builder: (context, state) => const SportScreen(),
        ),
        GoRoute(
          path: '/services/mobile',
           builder: (context, state) => const GenericServiceScreen(
             title: 'Mobile Plans', 
             heroTitle: 'Recharge & Data', 
             heroSubtitle: 'Stay connected always', 
             themeColor: Color(0xFF9333EA) // purple-600
           ),
        ),
        GoRoute(
          path: '/services/banking',
          builder: (context, state) => const GenericServiceScreen(
             title: 'Banking', 
             heroTitle: 'My Bank', 
             heroSubtitle: 'Secure digital banking', 
             themeColor: Color(0xFF1E40AF) // blue-800
           ),
        ),
      ],
    ),
  ],
);
