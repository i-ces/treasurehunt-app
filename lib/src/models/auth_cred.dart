import 'package:json_annotation/json_annotation.dart';

part 'auth_cred.g.dart';

@JsonSerializable()
class AuthCred {
  final String token;
  final String client;
  final String uid;

  AuthCred({required this.token, required this.client, required this.uid});

  factory AuthCred.fromJson(Map<String, dynamic> json) =>
      _$AuthCredFromJson(json);

  Map<String, dynamic> toJson() => _$AuthCredToJson(this);
}
