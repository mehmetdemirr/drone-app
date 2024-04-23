// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyProductModel _$CompanyProductModelFromJson(Map<String, dynamic> json) =>
    CompanyProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      tax: json['tax'] as String,
      weight: json['weight'] as String,
      imageUrl: json['image_url'] as String?,
      stockAmount: json['stock_amount'] as String,
      companyId: json['company_id'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CompanyProductModelToJson(
        CompanyProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'tax': instance.tax,
      'weight': instance.weight,
      'image_url': instance.imageUrl,
      'stock_amount': instance.stockAmount,
      'company_id': instance.companyId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
