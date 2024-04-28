// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyOrderDetailModel _$CompanyOrderDetailModelFromJson(
        Map<String, dynamic> json) =>
    CompanyOrderDetailModel(
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
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      orderItems: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompanyOrderDetailModelToJson(
        CompanyOrderDetailModel instance) =>
    <String, dynamic>{
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
      'user': instance.user,
      'order_items': instance.orderItems,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      companyId: json['company_id'] as String,
      userOrderId: json['user_order_id'] as String,
      productId: json['product_id'] as String,
      title: json['title'] as String?,
      price: json['price'] as String?,
      tax: json['tax'] as String?,
      amount: json['amount'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'company_id': instance.companyId,
      'user_order_id': instance.userOrderId,
      'product_id': instance.productId,
      'title': instance.title,
      'price': instance.price,
      'tax': instance.tax,
      'amount': instance.amount,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      avatarUrl: json['avatar_url'] as String?,
      userType: json['user_onesignal_id'] as String?,
      token: json['token'] as String,
      emailVerifiedAt: json['email_verified_at'],
      email: json['email'] as String,
      phone: json['phone'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'avatar_url': instance.avatarUrl,
      'user_onesignal_id': instance.userType,
      'token': instance.token,
      'email_verified_at': instance.emailVerifiedAt,
      'email': instance.email,
      'phone': instance.phone,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
