// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_customer_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyCustomerUserModel _$CompanyCustomerUserModelFromJson(
        Map<String, dynamic> json) =>
    CompanyCustomerUserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyCustomerUserModelToJson(
        CompanyCustomerUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'pivot': instance.pivot,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      companyId: json['company_id'] as String,
      userId: json['user_id'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'company_id': instance.companyId,
      'user_id': instance.userId,
      'id': instance.id,
    };
