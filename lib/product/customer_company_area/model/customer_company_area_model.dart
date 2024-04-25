import 'package:json_annotation/json_annotation.dart';

part 'customer_company_area_model.g.dart';

@JsonSerializable()
class CustomerCompanyAreaModel {
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "id")
  int id;

  CustomerCompanyAreaModel({
    required this.companyId,
    required this.description,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CustomerCompanyAreaModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerCompanyAreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerCompanyAreaModelToJson(this);
}
