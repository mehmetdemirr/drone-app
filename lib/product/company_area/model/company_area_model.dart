import 'package:json_annotation/json_annotation.dart';

part 'company_area_model.g.dart';

@JsonSerializable()
class CompanyAreaModel {
  @JsonKey(name: "company_id")
  int companyId;
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

  CompanyAreaModel({
    required this.companyId,
    required this.description,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CompanyAreaModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyAreaModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyAreaModelToJson(this);
}
