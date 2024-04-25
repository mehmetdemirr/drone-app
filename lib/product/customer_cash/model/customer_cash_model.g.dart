// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_cash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerCashModel _$CustomerCashModelFromJson(Map<String, dynamic> json) =>
    CustomerCashModel(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      lastPageUrl: json['last_page_url'] as String,
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

Map<String, dynamic> _$CustomerCashModelToJson(CustomerCashModel instance) =>
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

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      companyId: json['company_id'] as String,
      locationLatitude: json['location_latitude'] as String?,
      locationLongitude: json['location_longitude'] as String?,
      statusId: json['status_id'] as String,
      totalPrice: json['total_price'] as String,
      companyAreaId: json['company_area_id'] as String?,
      description: json['description'] as String?,
      paymentStatusId: json['payment_status_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      paymentStatus: json['payment_status'] == null
          ? null
          : Status.fromJson(json['payment_status'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'company_id': instance.companyId,
      'location_latitude': instance.locationLatitude,
      'location_longitude': instance.locationLongitude,
      'status_id': instance.statusId,
      'total_price': instance.totalPrice,
      'company_area_id': instance.companyAreaId,
      'description': instance.description,
      'payment_status_id': instance.paymentStatusId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'company': instance.company,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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
