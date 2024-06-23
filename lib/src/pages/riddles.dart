import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/selecting_numbers.dart';
import 'package:treasurehunt/src/utils/colors.dart';


class RiddlesPage extends StatelessWidget {
  final List<String> riddles = List.generate(20, (index) => 'Riddle ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    riddleNumber: index+1,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                riddles[index],
                style: TextStyle(fontSize: 18, color: AppColors.TextColor1),
              ),
            ),
          ),
        );
      },
    );
  }
}
