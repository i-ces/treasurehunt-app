import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String? name;
  final String? image;
  final String email;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  User({
    required this.id,
    this.name,
    this.image,
    required this.email,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
