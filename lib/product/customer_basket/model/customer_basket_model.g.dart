// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerBasketModel _$CustomerBasketModelFromJson(Map<String, dynamic> json) =>
    CustomerBasketModel(
      id: json['id'] as int,
      userId: json['user_id'] as String,
      companyId: json['company_id'] as String,
      locationLatitude: json['location_latitude'],
      locationLongitude: json['location_longitude'],
      statusId: json['status_id'] as String,
      totalPrice: json['total_price'] as String,
      companyAreaId: json['company_area_id'],
      description: json['description'],
      paymentStatusId: json['payment_status_id'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      orderItems: (json['order_items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerBasketModelToJson(
        CustomerBasketModel instance) =>
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
      'order_items': instance.orderItems,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      id: json['id'] as int,
      amount: json['amount'] as String,
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      tax: json['tax'] as String,
      weight: json['weight'] as String,
      stockAmount: json['stock_amount'] as String,
      companyId: json['company_id'] as String,
      status: json['status'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'tax': instance.tax,
      'weight': instance.weight,
      'stock_amount': instance.stockAmount,
      'company_id': instance.companyId,
      'status': instance.status,
      'image_url': instance.imageUrl,
    };
