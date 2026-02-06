import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:citizenone_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:citizenone_app/features/auth/presentation/screens/login_screen.dart';
import 'package:citizenone_app/core/common/widgets/app_shell.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/super_home_screen.dart';
// import 'package:citizenone_app/features/dashboard/presentation/screens/banking_dashboard_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loans_dashboard_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loan_marketplace_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/emi_calculator_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loan_application_flow_screen.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loan_journey_screens.dart';
import 'package:citizenone_app/features/loans/presentation/screens/loan_status_tracking_screen.dart';
import 'package:citizenone_app/features/ai_assistant/presentation/screens/ai_assistant_screen.dart';
import 'package:citizenone_app/features/services/presentation/screens/services_hub_screen.dart';
import 'package:citizenone_app/features/services/presentation/screens/service_screens.dart';
import 'package:citizenone_app/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:citizenone_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/sport_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/health_ezy_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/wealth_management_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/bill_pay_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/agri_service_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/logistics_service_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/sme_service_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/marketplace_service_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/insurance_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/govt_services_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/common_services_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/banking_screen.dart';
import 'package:citizenone_app/features/dashboard/presentation/screens/mini_services/mobile_recharge_screen.dart';
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
               path: 'personal',
                builder: (context, state) => const LoanMarketplaceScreen(loanType: 'Personal Loan'),
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
          builder: (context, state) => const AgriServiceScreen(),
        ),
        GoRoute(
          path: '/services/logistics',
          builder: (context, state) => const LogisticsServiceScreen(),
        ),
        GoRoute(
          path: '/services/sme',
          builder: (context, state) => const SmeServiceScreen(),
        ),
        GoRoute(
          path: '/services/market',
           builder: (context, state) => const MarketplaceServiceScreen(),
        ),
        GoRoute(
          path: '/services/insurance',
           builder: (context, state) => const InsuranceScreen(),
        ),
        GoRoute(
          path: '/services/gov',
           builder: (context, state) => const GovtServicesScreen(),
        ),
        GoRoute(
          path: '/services/common',
           builder: (context, state) => const CommonServicesScreen(),
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
           builder: (context, state) => const MobileRechargeScreen(),
        ),
        GoRoute(
          path: '/services/banking',
          builder: (context, state) => const BankingScreen(),
        ),
        // Fix for legacy/broken links pointing to /services/loans
        GoRoute(
          path: '/services/loans',
          redirect: (context, state) => '/loans', 
        ),
      ],
    ),
    
    // --- Fullscreen Routes (No Shell) ---
    GoRoute(
       path: '/loans/apply-flow',
       builder: (context, state) {
         final loanType = state.uri.queryParameters['loanType'] ?? 'Personal Loan';
         final bankName = state.uri.queryParameters['bankName'];
         return LoanApplicationFlowScreen(
           loanType: loanType,
           bankName: bankName,
         );
       },
     ),
     GoRoute(
       path: '/loans/status',
       builder: (context, state) {
         final referenceId = state.uri.queryParameters['ref'];
         return LoanStatusTrackingScreen(referenceId: referenceId);
       },
     ),
     GoRoute(
       path: '/loans/emi-calculator',
        builder: (context, state) => const EmiCalculatorScreen(),
     ),
  ],
);
