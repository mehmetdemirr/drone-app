import 'package:json_annotation/json_annotation.dart';

part 'company_customer_user_model.g.dart';

@JsonSerializable()
class CompanyCustomerUserModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "surname")
  String surname;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phone")
  String phone;
  @JsonKey(name: "pivot")
  Pivot pivot;

  CompanyCustomerUserModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.pivot,
  });

  factory CompanyCustomerUserModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyCustomerUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyCustomerUserModelToJson(this);
}

@JsonSerializable()
class Pivot {
  @JsonKey(name: "company_id")
  String companyId;
  @JsonKey(name: "user_id")
  String userId;
  @JsonKey(name: "id")
  String id;

  Pivot({
    required this.companyId,
    required this.userId,
    required this.id,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}
