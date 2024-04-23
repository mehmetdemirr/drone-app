// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyTokenModel _$CompanyTokenModelFromJson(Map<String, dynamic> json) =>
    CompanyTokenModel(
      token: json['token'] as String,
      companyId: json['company_id'] as int,
    );

Map<String, dynamic> _$CompanyTokenModelToJson(CompanyTokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'company_id': instance.companyId,
    };
