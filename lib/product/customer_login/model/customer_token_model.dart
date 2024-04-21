import 'package:json_annotation/json_annotation.dart';

part 'customer_token_model.g.dart';

@JsonSerializable()
class CustomerTokenModel {
  @JsonKey(name: "token")
  String token;

  CustomerTokenModel({
    required this.token,
  });

  factory CustomerTokenModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerTokenModelToJson(this);
}
