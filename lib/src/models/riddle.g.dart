// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riddle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Riddle _$RiddleFromJson(Map<String, dynamic> json) => Riddle(
      riddle_id: (json['riddle_id'] as num).toInt(),
      question: json['question'] as String,
      is_available: json['is_available'] as bool,
    );

Map<String, dynamic> _$RiddleToJson(Riddle instance) => <String, dynamic>{
      'riddle_id': instance.riddle_id,
      'question': instance.question,
      'is_available': instance.is_available,
    };
