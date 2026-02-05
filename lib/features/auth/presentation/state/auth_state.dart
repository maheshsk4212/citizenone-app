import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class AuthState {
  final UserRole selectedRole;
  final bool isAuthenticated;

  const AuthState({
    this.selectedRole = UserRole.citizen,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    UserRole? selectedRole,
    bool? isAuthenticated,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
