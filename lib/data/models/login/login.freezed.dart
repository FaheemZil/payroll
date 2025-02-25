// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String? get accessToken => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  CompanyInfo? get companyInfo => throw _privateConstructorUsedError;
  Companies? get companies => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  int? get isTwoFactorEnabled => throw _privateConstructorUsedError;
  int? get isAdvancedTwoFactorEnabled => throw _privateConstructorUsedError;
  String? get onBoardStatus => throw _privateConstructorUsedError;
  List<dynamic>? get onBoardingLoginCount => throw _privateConstructorUsedError;
  dynamic get twoFactor => throw _privateConstructorUsedError;
  int? get isV3LayoutEnabled => throw _privateConstructorUsedError;
  int? get isNewUser => throw _privateConstructorUsedError;
  int? get pendingPolicy => throw _privateConstructorUsedError;
  int? get showDemoModal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {bool? success,
      @JsonKey(name: 'access_token') String? accessToken,
      String? name,
      CompanyInfo? companyInfo,
      Companies? companies,
      bool? isVerified,
      int? isTwoFactorEnabled,
      int? isAdvancedTwoFactorEnabled,
      String? onBoardStatus,
      List<dynamic>? onBoardingLoginCount,
      dynamic twoFactor,
      int? isV3LayoutEnabled,
      int? isNewUser,
      int? pendingPolicy,
      int? showDemoModal});

  $CompanyInfoCopyWith<$Res>? get companyInfo;
  $CompaniesCopyWith<$Res>? get companies;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? accessToken = freezed,
    Object? name = freezed,
    Object? companyInfo = freezed,
    Object? companies = freezed,
    Object? isVerified = freezed,
    Object? isTwoFactorEnabled = freezed,
    Object? isAdvancedTwoFactorEnabled = freezed,
    Object? onBoardStatus = freezed,
    Object? onBoardingLoginCount = freezed,
    Object? twoFactor = freezed,
    Object? isV3LayoutEnabled = freezed,
    Object? isNewUser = freezed,
    Object? pendingPolicy = freezed,
    Object? showDemoModal = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      companyInfo: freezed == companyInfo
          ? _value.companyInfo
          : companyInfo // ignore: cast_nullable_to_non_nullable
              as CompanyInfo?,
      companies: freezed == companies
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as Companies?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTwoFactorEnabled: freezed == isTwoFactorEnabled
          ? _value.isTwoFactorEnabled
          : isTwoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdvancedTwoFactorEnabled: freezed == isAdvancedTwoFactorEnabled
          ? _value.isAdvancedTwoFactorEnabled
          : isAdvancedTwoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      onBoardStatus: freezed == onBoardStatus
          ? _value.onBoardStatus
          : onBoardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoardingLoginCount: freezed == onBoardingLoginCount
          ? _value.onBoardingLoginCount
          : onBoardingLoginCount // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      twoFactor: freezed == twoFactor
          ? _value.twoFactor
          : twoFactor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isV3LayoutEnabled: freezed == isV3LayoutEnabled
          ? _value.isV3LayoutEnabled
          : isV3LayoutEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      isNewUser: freezed == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingPolicy: freezed == pendingPolicy
          ? _value.pendingPolicy
          : pendingPolicy // ignore: cast_nullable_to_non_nullable
              as int?,
      showDemoModal: freezed == showDemoModal
          ? _value.showDemoModal
          : showDemoModal // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CompanyInfoCopyWith<$Res>? get companyInfo {
    if (_value.companyInfo == null) {
      return null;
    }

    return $CompanyInfoCopyWith<$Res>(_value.companyInfo!, (value) {
      return _then(_value.copyWith(companyInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CompaniesCopyWith<$Res>? get companies {
    if (_value.companies == null) {
      return null;
    }

    return $CompaniesCopyWith<$Res>(_value.companies!, (value) {
      return _then(_value.copyWith(companies: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      @JsonKey(name: 'access_token') String? accessToken,
      String? name,
      CompanyInfo? companyInfo,
      Companies? companies,
      bool? isVerified,
      int? isTwoFactorEnabled,
      int? isAdvancedTwoFactorEnabled,
      String? onBoardStatus,
      List<dynamic>? onBoardingLoginCount,
      dynamic twoFactor,
      int? isV3LayoutEnabled,
      int? isNewUser,
      int? pendingPolicy,
      int? showDemoModal});

  @override
  $CompanyInfoCopyWith<$Res>? get companyInfo;
  @override
  $CompaniesCopyWith<$Res>? get companies;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? accessToken = freezed,
    Object? name = freezed,
    Object? companyInfo = freezed,
    Object? companies = freezed,
    Object? isVerified = freezed,
    Object? isTwoFactorEnabled = freezed,
    Object? isAdvancedTwoFactorEnabled = freezed,
    Object? onBoardStatus = freezed,
    Object? onBoardingLoginCount = freezed,
    Object? twoFactor = freezed,
    Object? isV3LayoutEnabled = freezed,
    Object? isNewUser = freezed,
    Object? pendingPolicy = freezed,
    Object? showDemoModal = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      companyInfo: freezed == companyInfo
          ? _value.companyInfo
          : companyInfo // ignore: cast_nullable_to_non_nullable
              as CompanyInfo?,
      companies: freezed == companies
          ? _value.companies
          : companies // ignore: cast_nullable_to_non_nullable
              as Companies?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isTwoFactorEnabled: freezed == isTwoFactorEnabled
          ? _value.isTwoFactorEnabled
          : isTwoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdvancedTwoFactorEnabled: freezed == isAdvancedTwoFactorEnabled
          ? _value.isAdvancedTwoFactorEnabled
          : isAdvancedTwoFactorEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      onBoardStatus: freezed == onBoardStatus
          ? _value.onBoardStatus
          : onBoardStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      onBoardingLoginCount: freezed == onBoardingLoginCount
          ? _value._onBoardingLoginCount
          : onBoardingLoginCount // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      twoFactor: freezed == twoFactor
          ? _value.twoFactor
          : twoFactor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isV3LayoutEnabled: freezed == isV3LayoutEnabled
          ? _value.isV3LayoutEnabled
          : isV3LayoutEnabled // ignore: cast_nullable_to_non_nullable
              as int?,
      isNewUser: freezed == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingPolicy: freezed == pendingPolicy
          ? _value.pendingPolicy
          : pendingPolicy // ignore: cast_nullable_to_non_nullable
              as int?,
      showDemoModal: freezed == showDemoModal
          ? _value.showDemoModal
          : showDemoModal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl
    with DiagnosticableTreeMixin
    implements _LoginResponse {
  const _$LoginResponseImpl(
      {this.success,
      @JsonKey(name: 'access_token') this.accessToken,
      this.name,
      this.companyInfo,
      this.companies,
      this.isVerified,
      this.isTwoFactorEnabled,
      this.isAdvancedTwoFactorEnabled,
      this.onBoardStatus,
      final List<dynamic>? onBoardingLoginCount,
      this.twoFactor,
      this.isV3LayoutEnabled,
      this.isNewUser,
      this.pendingPolicy,
      this.showDemoModal})
      : _onBoardingLoginCount = onBoardingLoginCount;

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @override
  final String? name;
  @override
  final CompanyInfo? companyInfo;
  @override
  final Companies? companies;
  @override
  final bool? isVerified;
  @override
  final int? isTwoFactorEnabled;
  @override
  final int? isAdvancedTwoFactorEnabled;
  @override
  final String? onBoardStatus;
  final List<dynamic>? _onBoardingLoginCount;
  @override
  List<dynamic>? get onBoardingLoginCount {
    final value = _onBoardingLoginCount;
    if (value == null) return null;
    if (_onBoardingLoginCount is EqualUnmodifiableListView)
      return _onBoardingLoginCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic twoFactor;
  @override
  final int? isV3LayoutEnabled;
  @override
  final int? isNewUser;
  @override
  final int? pendingPolicy;
  @override
  final int? showDemoModal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginResponse(success: $success, accessToken: $accessToken, name: $name, companyInfo: $companyInfo, companies: $companies, isVerified: $isVerified, isTwoFactorEnabled: $isTwoFactorEnabled, isAdvancedTwoFactorEnabled: $isAdvancedTwoFactorEnabled, onBoardStatus: $onBoardStatus, onBoardingLoginCount: $onBoardingLoginCount, twoFactor: $twoFactor, isV3LayoutEnabled: $isV3LayoutEnabled, isNewUser: $isNewUser, pendingPolicy: $pendingPolicy, showDemoModal: $showDemoModal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('companyInfo', companyInfo))
      ..add(DiagnosticsProperty('companies', companies))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('isTwoFactorEnabled', isTwoFactorEnabled))
      ..add(DiagnosticsProperty(
          'isAdvancedTwoFactorEnabled', isAdvancedTwoFactorEnabled))
      ..add(DiagnosticsProperty('onBoardStatus', onBoardStatus))
      ..add(DiagnosticsProperty('onBoardingLoginCount', onBoardingLoginCount))
      ..add(DiagnosticsProperty('twoFactor', twoFactor))
      ..add(DiagnosticsProperty('isV3LayoutEnabled', isV3LayoutEnabled))
      ..add(DiagnosticsProperty('isNewUser', isNewUser))
      ..add(DiagnosticsProperty('pendingPolicy', pendingPolicy))
      ..add(DiagnosticsProperty('showDemoModal', showDemoModal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.companyInfo, companyInfo) ||
                other.companyInfo == companyInfo) &&
            (identical(other.companies, companies) ||
                other.companies == companies) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.isTwoFactorEnabled, isTwoFactorEnabled) ||
                other.isTwoFactorEnabled == isTwoFactorEnabled) &&
            (identical(other.isAdvancedTwoFactorEnabled,
                    isAdvancedTwoFactorEnabled) ||
                other.isAdvancedTwoFactorEnabled ==
                    isAdvancedTwoFactorEnabled) &&
            (identical(other.onBoardStatus, onBoardStatus) ||
                other.onBoardStatus == onBoardStatus) &&
            const DeepCollectionEquality()
                .equals(other._onBoardingLoginCount, _onBoardingLoginCount) &&
            const DeepCollectionEquality().equals(other.twoFactor, twoFactor) &&
            (identical(other.isV3LayoutEnabled, isV3LayoutEnabled) ||
                other.isV3LayoutEnabled == isV3LayoutEnabled) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser) &&
            (identical(other.pendingPolicy, pendingPolicy) ||
                other.pendingPolicy == pendingPolicy) &&
            (identical(other.showDemoModal, showDemoModal) ||
                other.showDemoModal == showDemoModal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      accessToken,
      name,
      companyInfo,
      companies,
      isVerified,
      isTwoFactorEnabled,
      isAdvancedTwoFactorEnabled,
      onBoardStatus,
      const DeepCollectionEquality().hash(_onBoardingLoginCount),
      const DeepCollectionEquality().hash(twoFactor),
      isV3LayoutEnabled,
      isNewUser,
      pendingPolicy,
      showDemoModal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {final bool? success,
      @JsonKey(name: 'access_token') final String? accessToken,
      final String? name,
      final CompanyInfo? companyInfo,
      final Companies? companies,
      final bool? isVerified,
      final int? isTwoFactorEnabled,
      final int? isAdvancedTwoFactorEnabled,
      final String? onBoardStatus,
      final List<dynamic>? onBoardingLoginCount,
      final dynamic twoFactor,
      final int? isV3LayoutEnabled,
      final int? isNewUser,
      final int? pendingPolicy,
      final int? showDemoModal}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  @JsonKey(name: 'access_token')
  String? get accessToken;
  @override
  String? get name;
  @override
  CompanyInfo? get companyInfo;
  @override
  Companies? get companies;
  @override
  bool? get isVerified;
  @override
  int? get isTwoFactorEnabled;
  @override
  int? get isAdvancedTwoFactorEnabled;
  @override
  String? get onBoardStatus;
  @override
  List<dynamic>? get onBoardingLoginCount;
  @override
  dynamic get twoFactor;
  @override
  int? get isV3LayoutEnabled;
  @override
  int? get isNewUser;
  @override
  int? get pendingPolicy;
  @override
  int? get showDemoModal;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) {
  return _CompanyInfo.fromJson(json);
}

/// @nodoc
mixin _$CompanyInfo {
  String? get companyId => throw _privateConstructorUsedError;
  String? get companyName => throw _privateConstructorUsedError;
  int? get isItDefault => throw _privateConstructorUsedError;
  bool? get isOwnCompany => throw _privateConstructorUsedError;
  bool? get parentOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyInfoCopyWith<CompanyInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyInfoCopyWith<$Res> {
  factory $CompanyInfoCopyWith(
          CompanyInfo value, $Res Function(CompanyInfo) then) =
      _$CompanyInfoCopyWithImpl<$Res, CompanyInfo>;
  @useResult
  $Res call(
      {String? companyId,
      String? companyName,
      int? isItDefault,
      bool? isOwnCompany,
      bool? parentOnly});
}

/// @nodoc
class _$CompanyInfoCopyWithImpl<$Res, $Val extends CompanyInfo>
    implements $CompanyInfoCopyWith<$Res> {
  _$CompanyInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? companyName = freezed,
    Object? isItDefault = freezed,
    Object? isOwnCompany = freezed,
    Object? parentOnly = freezed,
  }) {
    return _then(_value.copyWith(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      isItDefault: freezed == isItDefault
          ? _value.isItDefault
          : isItDefault // ignore: cast_nullable_to_non_nullable
              as int?,
      isOwnCompany: freezed == isOwnCompany
          ? _value.isOwnCompany
          : isOwnCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentOnly: freezed == parentOnly
          ? _value.parentOnly
          : parentOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyInfoImplCopyWith<$Res>
    implements $CompanyInfoCopyWith<$Res> {
  factory _$$CompanyInfoImplCopyWith(
          _$CompanyInfoImpl value, $Res Function(_$CompanyInfoImpl) then) =
      __$$CompanyInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? companyId,
      String? companyName,
      int? isItDefault,
      bool? isOwnCompany,
      bool? parentOnly});
}

/// @nodoc
class __$$CompanyInfoImplCopyWithImpl<$Res>
    extends _$CompanyInfoCopyWithImpl<$Res, _$CompanyInfoImpl>
    implements _$$CompanyInfoImplCopyWith<$Res> {
  __$$CompanyInfoImplCopyWithImpl(
      _$CompanyInfoImpl _value, $Res Function(_$CompanyInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyId = freezed,
    Object? companyName = freezed,
    Object? isItDefault = freezed,
    Object? isOwnCompany = freezed,
    Object? parentOnly = freezed,
  }) {
    return _then(_$CompanyInfoImpl(
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      isItDefault: freezed == isItDefault
          ? _value.isItDefault
          : isItDefault // ignore: cast_nullable_to_non_nullable
              as int?,
      isOwnCompany: freezed == isOwnCompany
          ? _value.isOwnCompany
          : isOwnCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      parentOnly: freezed == parentOnly
          ? _value.parentOnly
          : parentOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyInfoImpl with DiagnosticableTreeMixin implements _CompanyInfo {
  const _$CompanyInfoImpl(
      {this.companyId,
      this.companyName,
      this.isItDefault,
      this.isOwnCompany,
      this.parentOnly});

  factory _$CompanyInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyInfoImplFromJson(json);

  @override
  final String? companyId;
  @override
  final String? companyName;
  @override
  final int? isItDefault;
  @override
  final bool? isOwnCompany;
  @override
  final bool? parentOnly;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompanyInfo(companyId: $companyId, companyName: $companyName, isItDefault: $isItDefault, isOwnCompany: $isOwnCompany, parentOnly: $parentOnly)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CompanyInfo'))
      ..add(DiagnosticsProperty('companyId', companyId))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('isItDefault', isItDefault))
      ..add(DiagnosticsProperty('isOwnCompany', isOwnCompany))
      ..add(DiagnosticsProperty('parentOnly', parentOnly));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyInfoImpl &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.isItDefault, isItDefault) ||
                other.isItDefault == isItDefault) &&
            (identical(other.isOwnCompany, isOwnCompany) ||
                other.isOwnCompany == isOwnCompany) &&
            (identical(other.parentOnly, parentOnly) ||
                other.parentOnly == parentOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, companyId, companyName,
      isItDefault, isOwnCompany, parentOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyInfoImplCopyWith<_$CompanyInfoImpl> get copyWith =>
      __$$CompanyInfoImplCopyWithImpl<_$CompanyInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyInfoImplToJson(
      this,
    );
  }
}

abstract class _CompanyInfo implements CompanyInfo {
  const factory _CompanyInfo(
      {final String? companyId,
      final String? companyName,
      final int? isItDefault,
      final bool? isOwnCompany,
      final bool? parentOnly}) = _$CompanyInfoImpl;

  factory _CompanyInfo.fromJson(Map<String, dynamic> json) =
      _$CompanyInfoImpl.fromJson;

  @override
  String? get companyId;
  @override
  String? get companyName;
  @override
  int? get isItDefault;
  @override
  bool? get isOwnCompany;
  @override
  bool? get parentOnly;
  @override
  @JsonKey(ignore: true)
  _$$CompanyInfoImplCopyWith<_$CompanyInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Companies _$CompaniesFromJson(Map<String, dynamic> json) {
  return _Companies.fromJson(json);
}

/// @nodoc
mixin _$Companies {
  int? get totalCompanies => throw _privateConstructorUsedError;
  String? get parentComapnyId => throw _privateConstructorUsedError;
  String? get parentCompanyName => throw _privateConstructorUsedError;
  int? get invitedCompaniesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompaniesCopyWith<Companies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompaniesCopyWith<$Res> {
  factory $CompaniesCopyWith(Companies value, $Res Function(Companies) then) =
      _$CompaniesCopyWithImpl<$Res, Companies>;
  @useResult
  $Res call(
      {int? totalCompanies,
      String? parentComapnyId,
      String? parentCompanyName,
      int? invitedCompaniesCount});
}

/// @nodoc
class _$CompaniesCopyWithImpl<$Res, $Val extends Companies>
    implements $CompaniesCopyWith<$Res> {
  _$CompaniesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompanies = freezed,
    Object? parentComapnyId = freezed,
    Object? parentCompanyName = freezed,
    Object? invitedCompaniesCount = freezed,
  }) {
    return _then(_value.copyWith(
      totalCompanies: freezed == totalCompanies
          ? _value.totalCompanies
          : totalCompanies // ignore: cast_nullable_to_non_nullable
              as int?,
      parentComapnyId: freezed == parentComapnyId
          ? _value.parentComapnyId
          : parentComapnyId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCompanyName: freezed == parentCompanyName
          ? _value.parentCompanyName
          : parentCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedCompaniesCount: freezed == invitedCompaniesCount
          ? _value.invitedCompaniesCount
          : invitedCompaniesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompaniesImplCopyWith<$Res>
    implements $CompaniesCopyWith<$Res> {
  factory _$$CompaniesImplCopyWith(
          _$CompaniesImpl value, $Res Function(_$CompaniesImpl) then) =
      __$$CompaniesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalCompanies,
      String? parentComapnyId,
      String? parentCompanyName,
      int? invitedCompaniesCount});
}

/// @nodoc
class __$$CompaniesImplCopyWithImpl<$Res>
    extends _$CompaniesCopyWithImpl<$Res, _$CompaniesImpl>
    implements _$$CompaniesImplCopyWith<$Res> {
  __$$CompaniesImplCopyWithImpl(
      _$CompaniesImpl _value, $Res Function(_$CompaniesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompanies = freezed,
    Object? parentComapnyId = freezed,
    Object? parentCompanyName = freezed,
    Object? invitedCompaniesCount = freezed,
  }) {
    return _then(_$CompaniesImpl(
      totalCompanies: freezed == totalCompanies
          ? _value.totalCompanies
          : totalCompanies // ignore: cast_nullable_to_non_nullable
              as int?,
      parentComapnyId: freezed == parentComapnyId
          ? _value.parentComapnyId
          : parentComapnyId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCompanyName: freezed == parentCompanyName
          ? _value.parentCompanyName
          : parentCompanyName // ignore: cast_nullable_to_non_nullable
              as String?,
      invitedCompaniesCount: freezed == invitedCompaniesCount
          ? _value.invitedCompaniesCount
          : invitedCompaniesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompaniesImpl with DiagnosticableTreeMixin implements _Companies {
  const _$CompaniesImpl(
      {this.totalCompanies,
      this.parentComapnyId,
      this.parentCompanyName,
      this.invitedCompaniesCount});

  factory _$CompaniesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompaniesImplFromJson(json);

  @override
  final int? totalCompanies;
  @override
  final String? parentComapnyId;
  @override
  final String? parentCompanyName;
  @override
  final int? invitedCompaniesCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Companies(totalCompanies: $totalCompanies, parentComapnyId: $parentComapnyId, parentCompanyName: $parentCompanyName, invitedCompaniesCount: $invitedCompaniesCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Companies'))
      ..add(DiagnosticsProperty('totalCompanies', totalCompanies))
      ..add(DiagnosticsProperty('parentComapnyId', parentComapnyId))
      ..add(DiagnosticsProperty('parentCompanyName', parentCompanyName))
      ..add(
          DiagnosticsProperty('invitedCompaniesCount', invitedCompaniesCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompaniesImpl &&
            (identical(other.totalCompanies, totalCompanies) ||
                other.totalCompanies == totalCompanies) &&
            (identical(other.parentComapnyId, parentComapnyId) ||
                other.parentComapnyId == parentComapnyId) &&
            (identical(other.parentCompanyName, parentCompanyName) ||
                other.parentCompanyName == parentCompanyName) &&
            (identical(other.invitedCompaniesCount, invitedCompaniesCount) ||
                other.invitedCompaniesCount == invitedCompaniesCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCompanies, parentComapnyId,
      parentCompanyName, invitedCompaniesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      __$$CompaniesImplCopyWithImpl<_$CompaniesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompaniesImplToJson(
      this,
    );
  }
}

abstract class _Companies implements Companies {
  const factory _Companies(
      {final int? totalCompanies,
      final String? parentComapnyId,
      final String? parentCompanyName,
      final int? invitedCompaniesCount}) = _$CompaniesImpl;

  factory _Companies.fromJson(Map<String, dynamic> json) =
      _$CompaniesImpl.fromJson;

  @override
  int? get totalCompanies;
  @override
  String? get parentComapnyId;
  @override
  String? get parentCompanyName;
  @override
  int? get invitedCompaniesCount;
  @override
  @JsonKey(ignore: true)
  _$$CompaniesImplCopyWith<_$CompaniesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
