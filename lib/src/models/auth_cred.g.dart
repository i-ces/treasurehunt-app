// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cred.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthCred _$AuthCredFromJson(Map<String, dynamic> json) => AuthCred(
      token: json['token'] as String,
      client: json['client'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$AuthCredToJson(AuthCred instance) => <String, dynamic>{
      'token': instance.token,
      'client': instance.client,
      'uid': instance.uid,
    };
