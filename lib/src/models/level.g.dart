// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      id: (json['id'] as num).toInt(),
      level_int: (json['level_int'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'id': instance.id,
      'level_int': instance.level_int,
      'title': instance.title,
    };
