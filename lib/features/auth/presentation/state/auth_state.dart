import 'package:flutter/material.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class AuthState {
  final UserRole selectedRole;
  final bool isAuthenticated;
  final String workContext;
  final String? selectedPartner;
  final IconData? partnerIcon;
  final String? partnerType; // 'Bank', 'Insurance', 'MNO'

  const AuthState({
    this.selectedRole = UserRole.citizen,
    this.isAuthenticated = false,
    this.workContext = 'CitizenOne',
    this.selectedPartner,
    this.partnerIcon,
    this.partnerType,
  });

  AuthState copyWith({
    UserRole? selectedRole,
    bool? isAuthenticated,
    String? workContext,
    String? selectedPartner,
    IconData? partnerIcon,
    String? partnerType,
    bool clearPartner = false,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      workContext: workContext ?? this.workContext,
      selectedPartner: clearPartner ? null : (selectedPartner ?? this.selectedPartner),
      partnerIcon: clearPartner ? null : (partnerIcon ?? this.partnerIcon),
      partnerType: clearPartner ? null : (partnerType ?? this.partnerType),
    );
  }
}
