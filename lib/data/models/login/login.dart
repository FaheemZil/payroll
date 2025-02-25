import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@JsonSerializable(createFactory: false)
class LoginRequest {
  const LoginRequest({required this.username, required this.password});

  final String password;
  final String username;
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    bool? success,
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
    int? showDemoModal,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class CompanyInfo with _$CompanyInfo {
  const factory CompanyInfo({
    String? companyId,
    String? companyName,
    int? isItDefault,
    bool? isOwnCompany,
    bool? parentOnly,
  }) = _CompanyInfo;

  factory CompanyInfo.fromJson(Map<String, Object?> json) =>
      _$CompanyInfoFromJson(json);
}

@freezed
class Companies with _$Companies {
  const factory Companies({
    int? totalCompanies,
    String? parentComapnyId,
    String? parentCompanyName,
    int? invitedCompaniesCount,
  }) = _Companies;

  factory Companies.fromJson(Map<String, Object?> json) =>
      _$CompaniesFromJson(json);
}
