import 'package:json_annotation/json_annotation.dart';

part 'company_order_model.g.dart';

@JsonSerializable()
class CompanyOrderModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "status_id")
  String statusId;
  @JsonKey(name: "payment_status_id")
  String paymentStatusId;
  @JsonKey(name: "total_price")
  String totalPrice;
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  CompanyOrderModel({
    required this.id,
    required this.username,
    required this.statusId,
    required this.paymentStatusId,
    required this.totalPrice,
    required this.count,
    required this.createdAt,
  });

  factory CompanyOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyOrderModelToJson(this);
}
