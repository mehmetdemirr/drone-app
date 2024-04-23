import 'package:json_annotation/json_annotation.dart';

part 'customer_info_model.g.dart';

@JsonSerializable()
class CustomerInfoModel {
  @JsonKey(name: "user")
  User user;
  @JsonKey(name: "activeCompany")
  bool activeCompany;

  CustomerInfoModel({
    required this.user,
    required this.activeCompany,
  });

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerInfoModelToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "surname")
  String surname;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
