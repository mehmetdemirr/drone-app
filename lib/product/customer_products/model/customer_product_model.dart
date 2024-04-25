import 'package:json_annotation/json_annotation.dart';

part 'customer_product_model.g.dart';

@JsonSerializable()
class CustomerProductModel {
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
  @JsonKey(name: "image_url")
  String? imageUrl;
  @JsonKey(name: "stock_amount")
  String stockAmount;
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "status")
  String status;

  CustomerProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.tax,
    required this.weight,
    required this.imageUrl,
    required this.stockAmount,
    required this.companyId,
    required this.status,
  });

  factory CustomerProductModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerProductModelToJson(this);
}
