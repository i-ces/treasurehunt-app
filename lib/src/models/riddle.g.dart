// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riddle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Riddle _$RiddleFromJson(Map<String, dynamic> json) => Riddle(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      answer: json['answer'] as String,
      isTrap: json['is_trap'] as bool,
    );

Map<String, dynamic> _$RiddleToJson(Riddle instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
      'is_trap': instance.isTrap,
    };
