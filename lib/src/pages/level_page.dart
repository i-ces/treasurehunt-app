import 'package:flutter/material.dart';

import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_riddle_card.dart';

class LevelPage extends StatelessWidget {
  final List<String> riddles =
      List.generate(9, (index) => 'Level #0${index + 1}');

  LevelPage({this.level = 0, super.key});
  final int level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarHeight: 200,
        name: 'Levels',
        showDallo: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: riddles.length,
          itemBuilder: (context, index) {
            return CustomRiddleCard(
              riddle: riddles[index],
              id: index + 1,
              isCompleted: index == 0,
              isUnlocked: index == 1,
            );
            // return CustomRiddleCard(
            //     riddle: riddles[index], id: index + 1, isCompleted: index == 0);
          },
        ),
      ),
    );
  }
}
