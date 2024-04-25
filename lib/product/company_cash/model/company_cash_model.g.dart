// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_cash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyCashModel _$CompanyCashModelFromJson(Map<String, dynamic> json) =>
    CompanyCashModel(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => DatumCompanyCash.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int,
    );

Map<String, dynamic> _$CompanyCashModelToJson(CompanyCashModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'first_page_url': instance.firstPageUrl,
      'from': instance.from,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links,
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };

DatumCompanyCash _$DatumCompanyCashFromJson(Map<String, dynamic> json) =>
    DatumCompanyCash(
      id: json['id'] as int,
      username: json['username'] as String,
      statusId: json['status_id'] as String,
      paymentStatusId: json['payment_status_id'] as String,
      totalPrice: json['total_price'] as String,
      count: json['count'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$DatumCompanyCashToJson(DatumCompanyCash instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'status_id': instance.statusId,
      'payment_status_id': instance.paymentStatusId,
      'total_price': instance.totalPrice,
      'count': instance.count,
      'created_at': instance.createdAt.toIso8601String(),
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
