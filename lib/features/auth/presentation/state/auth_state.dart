import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:citizenone_app/features/auth/domain/entities/user_role.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(UserRole.citizen) UserRole selectedRole,
    @Default(false) bool isAuthenticated,
    @Default('CitizenOne') String workContext,
    String? selectedPartner,
    IconData? partnerIcon,
    String? partnerType,
  }) = _AuthState;
}
