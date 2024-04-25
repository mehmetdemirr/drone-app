import 'package:json_annotation/json_annotation.dart';

part 'company_order_details_model.g.dart';

@JsonSerializable()
class CompanyOrderDetailModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "location_latitude")
  String? locationLatitude;
  @JsonKey(name: "location_longitude")
  String? locationLongitude;
  @JsonKey(name: "status_id")
  String statusId;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "company_area_id")
  String? companyAreaId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "payment_status_id")
  String? paymentStatusId;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "user")
  User user;
  @JsonKey(name: "order_items")
  List<OrderItem> orderItems;

  CompanyOrderDetailModel({
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
    required this.user,
    required this.orderItems,
  });

  factory CompanyOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyOrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyOrderDetailModelToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "user_order_id")
  String userOrderId;
  @JsonKey(name: "product_id")
  String productId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "price")
  String? price;
  @JsonKey(name: "tax")
  String? tax;
  @JsonKey(name: "amount")
  String amount;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  OrderItem({
    required this.id,
    required this.userId,
    required this.companyId,
    required this.userOrderId,
    required this.productId,
    required this.title,
    required this.price,
    required this.tax,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "surname")
  String surname;
  @JsonKey(name: "avatar_url")
  String avatarUrl;
  @JsonKey(name: "user_type")
  String userType;
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "email_verified_at")
  dynamic emailVerifiedAt;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.avatarUrl,
    required this.userType,
    required this.token,
    required this.emailVerifiedAt,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
