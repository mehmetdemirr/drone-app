// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyStatisticModel _$CompanyStatisticModelFromJson(
        Map<String, dynamic> json) =>
    CompanyStatisticModel(
      orders: Orders.fromJson(json['orders'] as Map<String, dynamic>),
      products: Products.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyStatisticModelToJson(
        CompanyStatisticModel instance) =>
    <String, dynamic>{
      'orders': instance.orders,
      'products': instance.products,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      totalOrders: json['totalOrders'] as int,
      successfulOrders: json['successfulOrders'] as int,
      orderStatusCounts: OrderStatusCounts.fromJson(
          json['orderStatusCounts'] as Map<String, dynamic>),
      totalSales: json['totalSales'] as String,
      customerCount: json['customerCount'] as int,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'totalOrders': instance.totalOrders,
      'successfulOrders': instance.successfulOrders,
      'orderStatusCounts': instance.orderStatusCounts,
      'totalSales': instance.totalSales,
      'customerCount': instance.customerCount,
    };

OrderStatusCounts _$OrderStatusCountsFromJson(Map<String, dynamic> json) =>
    OrderStatusCounts(
      the2: json['2'] as String,
    );

Map<String, dynamic> _$OrderStatusCountsToJson(OrderStatusCounts instance) =>
    <String, dynamic>{
      '2': instance.the2,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      topSeller: (json['topSeller'] as List<dynamic>)
          .map((e) => Seller.fromJson(e as Map<String, dynamic>))
          .toList(),
      worstSeller: (json['worstSeller'] as List<dynamic>)
          .map((e) => Seller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'topSeller': instance.topSeller,
      'worstSeller': instance.worstSeller,
    };

Seller _$SellerFromJson(Map<String, dynamic> json) => Seller(
      productId: json['product_id'] as String,
      totalSold: json['total_sold'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$SellerToJson(Seller instance) => <String, dynamic>{
      'product_id': instance.productId,
      'total_sold': instance.totalSold,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
    };
