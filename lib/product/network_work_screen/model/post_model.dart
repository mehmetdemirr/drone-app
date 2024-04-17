import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "post_model.g.dart";

@JsonSerializable()
class PostModel extends Equatable {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  const PostModel({this.userId, this.id, this.title, this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostModelToJson(this);
  }

  @override
  List<Object?> get props => [userId, id];
}
