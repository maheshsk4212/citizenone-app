// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  UserRole get selectedRole => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String get workContext => throw _privateConstructorUsedError;
  String? get selectedPartner => throw _privateConstructorUsedError;
  IconData? get partnerIcon => throw _privateConstructorUsedError;
  String? get partnerType => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    UserRole selectedRole,
    bool isAuthenticated,
    String workContext,
    String? selectedPartner,
    IconData? partnerIcon,
    String? partnerType,
  });
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRole = null,
    Object? isAuthenticated = null,
    Object? workContext = null,
    Object? selectedPartner = freezed,
    Object? partnerIcon = freezed,
    Object? partnerType = freezed,
  }) {
    return _then(
      _value.copyWith(
            selectedRole: null == selectedRole
                ? _value.selectedRole
                : selectedRole // ignore: cast_nullable_to_non_nullable
                      as UserRole,
            isAuthenticated: null == isAuthenticated
                ? _value.isAuthenticated
                : isAuthenticated // ignore: cast_nullable_to_non_nullable
                      as bool,
            workContext: null == workContext
                ? _value.workContext
                : workContext // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedPartner: freezed == selectedPartner
                ? _value.selectedPartner
                : selectedPartner // ignore: cast_nullable_to_non_nullable
                      as String?,
            partnerIcon: freezed == partnerIcon
                ? _value.partnerIcon
                : partnerIcon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            partnerType: freezed == partnerType
                ? _value.partnerType
                : partnerType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
    _$AuthStateImpl value,
    $Res Function(_$AuthStateImpl) then,
  ) = __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    UserRole selectedRole,
    bool isAuthenticated,
    String workContext,
    String? selectedPartner,
    IconData? partnerIcon,
    String? partnerType,
  });
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
    _$AuthStateImpl _value,
    $Res Function(_$AuthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedRole = null,
    Object? isAuthenticated = null,
    Object? workContext = null,
    Object? selectedPartner = freezed,
    Object? partnerIcon = freezed,
    Object? partnerType = freezed,
  }) {
    return _then(
      _$AuthStateImpl(
        selectedRole: null == selectedRole
            ? _value.selectedRole
            : selectedRole // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        isAuthenticated: null == isAuthenticated
            ? _value.isAuthenticated
            : isAuthenticated // ignore: cast_nullable_to_non_nullable
                  as bool,
        workContext: null == workContext
            ? _value.workContext
            : workContext // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedPartner: freezed == selectedPartner
            ? _value.selectedPartner
            : selectedPartner // ignore: cast_nullable_to_non_nullable
                  as String?,
        partnerIcon: freezed == partnerIcon
            ? _value.partnerIcon
            : partnerIcon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        partnerType: freezed == partnerType
            ? _value.partnerType
            : partnerType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    this.selectedRole = UserRole.citizen,
    this.isAuthenticated = false,
    this.workContext = 'CitizenOne',
    this.selectedPartner,
    this.partnerIcon,
    this.partnerType,
  });

  @override
  @JsonKey()
  final UserRole selectedRole;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  @JsonKey()
  final String workContext;
  @override
  final String? selectedPartner;
  @override
  final IconData? partnerIcon;
  @override
  final String? partnerType;

  @override
  String toString() {
    return 'AuthState(selectedRole: $selectedRole, isAuthenticated: $isAuthenticated, workContext: $workContext, selectedPartner: $selectedPartner, partnerIcon: $partnerIcon, partnerType: $partnerType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.selectedRole, selectedRole) ||
                other.selectedRole == selectedRole) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.workContext, workContext) ||
                other.workContext == workContext) &&
            (identical(other.selectedPartner, selectedPartner) ||
                other.selectedPartner == selectedPartner) &&
            (identical(other.partnerIcon, partnerIcon) ||
                other.partnerIcon == partnerIcon) &&
            (identical(other.partnerType, partnerType) ||
                other.partnerType == partnerType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedRole,
    isAuthenticated,
    workContext,
    selectedPartner,
    partnerIcon,
    partnerType,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    final UserRole selectedRole,
    final bool isAuthenticated,
    final String workContext,
    final String? selectedPartner,
    final IconData? partnerIcon,
    final String? partnerType,
  }) = _$AuthStateImpl;

  @override
  UserRole get selectedRole;
  @override
  bool get isAuthenticated;
  @override
  String get workContext;
  @override
  String? get selectedPartner;
  @override
  IconData? get partnerIcon;
  @override
  String? get partnerType;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
