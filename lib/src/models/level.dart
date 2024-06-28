import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable()
class Level {
  @JsonKey(name: 'level_int')
  final int level;
  final String title;
  final String status;

  Level({
    required this.level,
    required this.title,
    required this.status,
  });

  factory Level.fromJson(final Map<String, dynamic> json) =>
      _$LevelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelToJson(this);
}
