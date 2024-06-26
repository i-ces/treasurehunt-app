import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/custom_riddle_card.dart';

class RiddlesPage extends StatelessWidget {
  final List<String> riddles =
      List.generate(9, (index) => 'Riddle #0${index + 1}');

  RiddlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: riddles.length,
      itemBuilder: (context, index) {
        return CustomRiddleCard(
            riddle: riddles[index], id: index + 1, isCompleted: index == 0);
      },
    );
  }
}
