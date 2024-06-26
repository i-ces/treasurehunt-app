import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/selecting_numbers.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomRiddleCard extends StatelessWidget {
  const CustomRiddleCard({
    super.key,
    required this.riddle,
    required this.id,
    this.isCompleted = false,
  });

  final bool isCompleted;
  final String riddle;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isCompleted ? AppColors.AccentColor : AppColors.FadedGrey,
        boxShadow: const [
          BoxShadow(
            color: AppColors.FadedGrey,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RiddleDetailPage(
                riddleTitle: riddle,
                riddleNumber: id,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isCompleted) ...[
                Icon(
                  Icons.lock,
                  color: isCompleted
                      ? Colors.white
                      : AppColors.TextColor1.withOpacity(0.6),
                ),
                const SizedBox(width: 50),
              ],
              Text(
                riddle,
                style: TextStyle(
                  fontSize: 20,
                  color: isCompleted
                      ? Colors.white
                      : AppColors.TextColor1.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
