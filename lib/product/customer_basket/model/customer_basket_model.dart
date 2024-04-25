import 'package:json_annotation/json_annotation.dart';

part 'customer_basket_model.g.dart';

@JsonSerializable()
class CustomerBasketModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "location_latitude")
  dynamic locationLatitude;
  @JsonKey(name: "location_longitude")
  dynamic locationLongitude;
  @JsonKey(name: "status_id")
  String statusId;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "company_area_id")
  dynamic companyAreaId;
  @JsonKey(name: "description")
  dynamic description;
  @JsonKey(name: "payment_status_id")
  dynamic paymentStatusId;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "order_items")
  List<OrderItem> orderItems;

  CustomerBasketModel({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.locationLatitude,
    required this.locationLongitude,
    required this.statusId,
    required this.totalPrice,
    required this.companyAreaId,
    required this.description,
    required this.paymentStatusId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderItems,
  });

  factory CustomerBasketModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerBasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerBasketModelToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "amount")
  String amount;
  @JsonKey(name: "product")
  Product product;

  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "price")
  String price;
  @JsonKey(name: "tax")
  String tax;
  @JsonKey(name: "weight")
  String weight;
  @JsonKey(name: "stock_amount")
  String stockAmount;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "image_url")
  String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.tax,
    required this.weight,
    required this.stockAmount,
    required this.companyId,
    required this.status,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
