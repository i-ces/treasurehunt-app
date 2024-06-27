import 'package:json_annotation/json_annotation.dart';
import 'package:treasurehunt/src/models/riddle.dart';

part 'level.g.dart';

@JsonSerializable(explicitToJson: true)
class Level {
  final int level_id;
  final List<Riddle> riddles;

  Level({
    required this.level_id,
    required this.riddles,
  });

  factory Level.fromJson(final Map<String, dynamic> json) =>
      _$LevelFromJson(json);
}
