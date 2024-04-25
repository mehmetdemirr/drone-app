// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_company_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCompanyAreaModel _$CustomerCompanyAreaModelFromJson(
        Map<String, dynamic> json) =>
    CustomerCompanyAreaModel(
      companyId: json['company_id'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$CustomerCompanyAreaModelToJson(
        CustomerCompanyAreaModel instance) =>
    <String, dynamic>{
      'company_id': instance.companyId,
      'description': instance.description,
      'title': instance.title,
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
