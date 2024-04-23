import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyTokenModel {
  @JsonKey(name: "token")
  String token;
  @JsonKey(name: "company_id")
  int companyId;

  CompanyTokenModel({
    required this.token,
    required this.companyId,
  });

  factory CompanyTokenModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyTokenModelToJson(this);
}
