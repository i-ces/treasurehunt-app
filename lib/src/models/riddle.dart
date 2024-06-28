import 'package:json_annotation/json_annotation.dart';

part 'riddle.g.dart';

@JsonSerializable(explicitToJson: true)
class Riddle {
  final int id;
  final String question;
  final String answer;

  @JsonKey(name: 'is_trap')
  final bool isTrap;

  Riddle({
    required this.id,
    required this.question,
    required this.answer,
    required this.isTrap,
  });

  factory Riddle.fromJson(final Map<String, dynamic> json) =>
      _$RiddleFromJson(json);

  Map<String, dynamic> toJson() => _$RiddleToJson(this);
}
