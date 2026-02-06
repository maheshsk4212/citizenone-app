import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:citizenone_app/features/dashboard/domain/entities/service_entity.dart';

final servicesProvider = Provider<List<ServiceEntity>>((ref) {
  final role = ref.watch(authProvider).selectedRole;

  final allServices = [
    const ServiceEntity(
      id: 'agri',
      title: 'Agri Services',
      description: 'Farming tools',
      icon: LucideIcons.sprout,
      type: ServiceType.utilities,
      availableTo: [UserRole.citizen],
      route: '/services/agri',
      color: Color(0xFF16A34A), // Green
    ),
    const ServiceEntity(
      id: 'logistics',
      title: 'Logistics',
      description: 'Ship & Track',
      icon: LucideIcons.truck,
      type: ServiceType.utilities,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/logistics',
      color: Color(0xFFEA580C), // Orange
    ),
    const ServiceEntity(
      id: 'sme',
      title: 'SME Services',
      description: 'Business tools',
      icon: LucideIcons.briefcase,
      type: ServiceType.banking,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/sme',
      color: Color(0xFF4F46E5), // Indigo
    ),
    const ServiceEntity(
      id: 'market',
      title: 'Marketplace',
      description: 'Buy & Sell',
      icon: LucideIcons.store,
      type: ServiceType.utilities, // or commercial?
      availableTo: [UserRole.citizen],
      route: '/services/market',
      color: Color(0xFFDB2777), // Pink
    ),
    const ServiceEntity(
      id: 'wealth',
      title: 'Wealth',
      description: 'Wealth',
      icon: LucideIcons.circle_dollar_sign,
      type: ServiceType.banking,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/wealth',
      color: Color(0xFF7C3AED), // Purple
    ),
    const ServiceEntity(
      id: 'health',
      title: 'HealthEzy',
      description: 'Health',
      icon: LucideIcons.heart,
      type: ServiceType.healthcare,
      availableTo: [UserRole.citizen],
      route: '/services/health',
      color: Color(0xFFEF4444), // Red
    ),
    const ServiceEntity(
      id: 'sport',
      title: 'Sport & Mind',
      description: 'Sport',
      icon: LucideIcons.dumbbell,
      type: ServiceType.education,
      availableTo: [UserRole.citizen],
      route: '/services/sport',
      color: Color(0xFF10B981), // Green
    ),
    const ServiceEntity(
      id: 'bills',
      title: 'Bill Pay',
      description: 'Bills',
      icon: LucideIcons.receipt,
      type: ServiceType.utilities,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/bills',
      color: Color(0xFFF97316), // Orange
    ),
    const ServiceEntity(
      id: 'insurance',
      title: 'Insurance',
      description: 'Insurance',
      icon: LucideIcons.shield,
      type: ServiceType.banking,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/insurance',
      color: Color(0xFFEF4444), // Red
    ),
    const ServiceEntity(
      id: 'govt',
      title: 'Govt Services',
      description: 'Govt',
      icon: LucideIcons.landmark,
      type: ServiceType.utilities,
      availableTo: [UserRole.citizen],
      route: '/services/gov',
      color: Color(0xFF0891B2), // Teal/Cyan
    ),
    const ServiceEntity(
      id: 'common',
      title: 'Common Svcs',
      description: 'Common',
      icon: LucideIcons.layout_grid,
      type: ServiceType.utilities,
      availableTo: [UserRole.citizen],
      route: '/services/common',
      color: Color(0xFF3B82F6), // Blue
    ),
    const ServiceEntity(
      id: 'banking',
      title: 'Banking',
      description: 'Banking',
      icon: LucideIcons.building_2,
      type: ServiceType.banking,
      availableTo: [UserRole.citizen, UserRole.agent],
      route: '/services/banking',
      color: Color(0xFF2563EB), // Blue
    ),
  ];

  return allServices; // Return all for now to match screenshot 8-grid
});
