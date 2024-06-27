import 'package:flutter/material.dart';

import 'package:treasurehunt/src/screens/selecting_numbers.dart';

import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';

class LevelPage extends StatelessWidget {
  final List<String> riddles =
      List.generate(9, (index) => 'Level #0${index + 1}');

  LevelPage({this.level = 0, super.key});
  final int level;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 200,
        name: '',
        showDallo: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: riddles.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiddleDetailPage(
                      riddleTitle: riddles[index],
                      riddleNumber: index + 1,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  riddles[index],
                  style: const TextStyle(
                      fontSize: 18, color: AppColors.TextColor1),
                ),
              ),
            ),
          );
          // return CustomRiddleCard(
          //     riddle: riddles[index], id: index + 1, isCompleted: index == 0);
        },
      ),
    );
  }
}
