import 'package:json_annotation/json_annotation.dart';

part 'riddle.g.dart';

@JsonSerializable(explicitToJson: true)
class Riddle {
  final int riddle_id;
  final String question;
  final bool is_available;

  Riddle({
    required this.riddle_id,
    required this.question,
    required this.is_available,
  });

  factory Riddle.fromJson(final Map<String, dynamic> json) =>
      _$RiddleFromJson(json);
}
