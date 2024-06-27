import 'package:json_annotation/json_annotation.dart';
import 'package:treasurehunt/src/models/riddle.dart';

part 'level.g.dart';

@JsonSerializable()
class Level {
  final int id;
  final int level_int;
  final String title;

  Level({
    required this.id,
    required this.level_int,
    required this.title,
  });

  factory Level.fromJson(final Map<String, dynamic> json) =>
      _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}
