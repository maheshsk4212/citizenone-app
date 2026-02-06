import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

class AuthState {
  final UserRole selectedRole;
  final bool isAuthenticated;
  final String workContext;
  final String? selectedPartner;
  final IconData? partnerIcon;

  const AuthState({
    this.selectedRole = UserRole.citizen,
    this.isAuthenticated = false,
    this.workContext = 'CitizenOne',
    this.selectedPartner,
    this.partnerIcon,
  });

  AuthState copyWith({
    UserRole? selectedRole,
    bool? isAuthenticated,
    String? workContext,
    String? selectedPartner,
    IconData? partnerIcon,
  }) {
    return AuthState(
      selectedRole: selectedRole ?? this.selectedRole,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      workContext: workContext ?? this.workContext,
      selectedPartner: selectedPartner ?? this.selectedPartner,
      partnerIcon: partnerIcon ?? this.partnerIcon,
    );
  }
}
