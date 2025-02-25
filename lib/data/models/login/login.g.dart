// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'username': instance.username,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      success: json['success'] as bool?,
      accessToken: json['access_token'] as String?,
      name: json['name'] as String?,
      companyInfo:
          json['companyInfo'] == null
              ? null
              : CompanyInfo.fromJson(
                json['companyInfo'] as Map<String, dynamic>,
              ),
      companies:
          json['companies'] == null
              ? null
              : Companies.fromJson(json['companies'] as Map<String, dynamic>),
      isVerified: json['isVerified'] as bool?,
      isTwoFactorEnabled: (json['isTwoFactorEnabled'] as num?)?.toInt(),
      isAdvancedTwoFactorEnabled:
          (json['isAdvancedTwoFactorEnabled'] as num?)?.toInt(),
      onBoardStatus: json['onBoardStatus'] as String?,
      onBoardingLoginCount: json['onBoardingLoginCount'] as List<dynamic>?,
      twoFactor: json['twoFactor'],
      isV3LayoutEnabled: (json['isV3LayoutEnabled'] as num?)?.toInt(),
      isNewUser: (json['isNewUser'] as num?)?.toInt(),
      pendingPolicy: (json['pendingPolicy'] as num?)?.toInt(),
      showDemoModal: (json['showDemoModal'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'access_token': instance.accessToken,
      'name': instance.name,
      'companyInfo': instance.companyInfo,
      'companies': instance.companies,
      'isVerified': instance.isVerified,
      'isTwoFactorEnabled': instance.isTwoFactorEnabled,
      'isAdvancedTwoFactorEnabled': instance.isAdvancedTwoFactorEnabled,
      'onBoardStatus': instance.onBoardStatus,
      'onBoardingLoginCount': instance.onBoardingLoginCount,
      'twoFactor': instance.twoFactor,
      'isV3LayoutEnabled': instance.isV3LayoutEnabled,
      'isNewUser': instance.isNewUser,
      'pendingPolicy': instance.pendingPolicy,
      'showDemoModal': instance.showDemoModal,
    };

_$CompanyInfoImpl _$$CompanyInfoImplFromJson(Map<String, dynamic> json) =>
    _$CompanyInfoImpl(
      companyId: json['companyId'] as String?,
      companyName: json['companyName'] as String?,
      isItDefault: (json['isItDefault'] as num?)?.toInt(),
      isOwnCompany: json['isOwnCompany'] as bool?,
      parentOnly: json['parentOnly'] as bool?,
    );

Map<String, dynamic> _$$CompanyInfoImplToJson(_$CompanyInfoImpl instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'isItDefault': instance.isItDefault,
      'isOwnCompany': instance.isOwnCompany,
      'parentOnly': instance.parentOnly,
    };

_$CompaniesImpl _$$CompaniesImplFromJson(Map<String, dynamic> json) =>
    _$CompaniesImpl(
      totalCompanies: (json['totalCompanies'] as num?)?.toInt(),
      parentComapnyId: json['parentComapnyId'] as String?,
      parentCompanyName: json['parentCompanyName'] as String?,
      invitedCompaniesCount: (json['invitedCompaniesCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CompaniesImplToJson(_$CompaniesImpl instance) =>
    <String, dynamic>{
      'totalCompanies': instance.totalCompanies,
      'parentComapnyId': instance.parentComapnyId,
      'parentCompanyName': instance.parentCompanyName,
      'invitedCompaniesCount': instance.invitedCompaniesCount,
    };
