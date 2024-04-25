import 'package:json_annotation/json_annotation.dart';

part 'company_statistic_model.g.dart';

@JsonSerializable()
class CompanyStatisticModel {
  @JsonKey(name: "orders")
  Orders orders;
  @JsonKey(name: "products")
  Products products;

  CompanyStatisticModel({
    required this.orders,
    required this.products,
  });

  factory CompanyStatisticModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyStatisticModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyStatisticModelToJson(this);
}

@JsonSerializable()
class Orders {
  @JsonKey(name: "totalOrders")
  int totalOrders;
  @JsonKey(name: "successfulOrders")
  int successfulOrders;
  @JsonKey(name: "orderStatusCounts")
  OrderStatusCounts orderStatusCounts;
  @JsonKey(name: "totalSales")
  String totalSales;
  @JsonKey(name: "customerCount")
  int customerCount;

  Orders({
    required this.totalOrders,
    required this.successfulOrders,
    required this.orderStatusCounts,
    required this.totalSales,
    required this.customerCount,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable()
class OrderStatusCounts {
  @JsonKey(name: "2")
  String the2;

  OrderStatusCounts({
    required this.the2,
  });

  factory OrderStatusCounts.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusCountsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusCountsToJson(this);
}

@JsonSerializable()
class Products {
  @JsonKey(name: "topSeller")
  List<Seller> topSeller;
  @JsonKey(name: "worstSeller")
  List<Seller> worstSeller;

  Products({
    required this.topSeller,
    required this.worstSeller,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

@JsonSerializable()
class Seller {
  @JsonKey(name: "product_id")
  String productId;
  @JsonKey(name: "total_sold")
  String totalSold;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "price")
  String price;
  @JsonKey(name: "description")
  String description;

  Seller({
    required this.productId,
    required this.totalSold,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);

  Map<String, dynamic> toJson() => _$SellerToJson(this);
}
