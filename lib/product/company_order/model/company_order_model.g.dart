// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyOrderModel _$CompanyOrderModelFromJson(Map<String, dynamic> json) =>
    CompanyOrderModel(
      id: json['id'] as int,
      username: json['username'] as String,
      statusId: json['status_id'] as String,
      paymentStatusId: json['payment_status_id'] as String,
      totalPrice: json['total_price'] as String,
      count: json['count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CompanyOrderModelToJson(CompanyOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'status_id': instance.statusId,
      'payment_status_id': instance.paymentStatusId,
      'total_price': instance.totalPrice,
      'count': instance.count,
      'created_at': instance.createdAt.toIso8601String(),
    };
