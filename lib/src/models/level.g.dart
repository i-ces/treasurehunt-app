// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      level: (json['level_int'] as num).toInt(),
      title: json['title'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'level_int': instance.level,
      'title': instance.title,
      'status': instance.status,
    };
