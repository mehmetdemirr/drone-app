import 'package:json_annotation/json_annotation.dart';

part 'company_info_model.g.dart';

@JsonSerializable()
class CompanyInfoModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "open_hour")
  dynamic openHour;
  @JsonKey(name: "close_hour")
  dynamic closeHour;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "password")
  String password;
  @JsonKey(name: "created_at")
  DateTime createdAt;
  @JsonKey(name: "updated_at")
  DateTime updatedAt;

  CompanyInfoModel({
    required this.id,
    required this.title,
    required this.status,
    required this.openHour,
    required this.closeHour,
    required this.email,
    required this.phone,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CompanyInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoModelToJson(this);
}
