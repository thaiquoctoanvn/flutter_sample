import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
// POJO model
@JsonSerializable()
class User {
  int id = -1;
  String name = "";
  String? email;
  String? gender;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  User({required this.id, required this.name, this.email, this.gender, this.status, this.createdAt, this.updatedAt});

  // Parse json to user model
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  // Parse user model to json
  Map<String, dynamic> toJson() => _$UserToJson(this);
}