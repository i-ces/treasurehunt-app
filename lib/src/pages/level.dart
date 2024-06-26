import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/custom_riddle_card.dart';

class LevelPage extends StatelessWidget {
  final List<String> riddles =
      List.generate(9, (index) => 'Level #0${index + 1}');

  LevelPage({this.level = 0, super.key});
  final int level;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: riddles.length,
      itemBuilder: (context, index) {
        return CustomRiddleCard(
          riddle: riddles[index],
          id: index + 1,
          isCompleted: index < level,
          isUnlocked: index == level,
        );
      },
    );
  }
}
