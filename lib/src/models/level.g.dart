// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      level_id: (json['level_id'] as num).toInt(),
      riddles: (json['riddles'] as List<dynamic>)
          .map((e) => Riddle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'level_id': instance.level_id,
      'riddles': instance.riddles.map((e) => e.toJson()).toList(),
    };
