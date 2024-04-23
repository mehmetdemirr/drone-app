// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerInfoModel _$CustomerInfoModelFromJson(Map<String, dynamic> json) =>
    CustomerInfoModel(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      activeCompany: json['activeCompany'] as bool,
    );

Map<String, dynamic> _$CustomerInfoModelToJson(CustomerInfoModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'activeCompany': instance.activeCompany,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
