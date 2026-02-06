import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';
import 'package:citizenone_app/features/auth/presentation/state/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return const AuthState();
  }

  void setRole(UserRole role) {
    state = state.copyWith(selectedRole: role);
  }

  void setWorkContext(String context) {
    state = state.copyWith(workContext: context);
  }

  void setPartner(String? name, IconData? icon) {
    state = state.copyWith(
      selectedPartner: name,
      partnerIcon: icon,
      workContext: 'Agent', // Switch back to Agent context after selection
    );
  }

  void login() {
    state = state.copyWith(isAuthenticated: true);
  }

  void logout() {
    state = state.copyWith(isAuthenticated: false);
  }
}

final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
