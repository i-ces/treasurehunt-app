import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomRiddleCard extends StatelessWidget {
  const CustomRiddleCard({
    super.key,
    required this.riddle,
    required this.id,
    this.isCompleted = false,
    this.isUnlocked = false,
  });

  final int id;
  final String riddle;
  final bool isCompleted;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: isCompleted
            ? Colors.green
            : isUnlocked
                ? AppColors.AccentColor
                : AppColors.FadedGrey,
        boxShadow: const [
          BoxShadow(
            color: AppColors.FadedGrey,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (isCompleted)
            //   Align(
            //     alignment: Alignment.centerLeft,
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //       child: Icon(
            //         CupertinoIcons.checkmark_alt_circle_fill,
            //         color: Colors.green,
            //       ),
            //     ),
            //   ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                isUnlocked
                    ? CupertinoIcons.lock_open_fill
                    : CupertinoIcons.lock_fill,
                color: isCompleted
                    ? Colors.green
                    : isUnlocked
                        ? Colors.white
                        : AppColors.TextColor1.withOpacity(0.6),
              ),
            ),
            const SizedBox(width: 20),

            Expanded(
              child: Text(
                riddle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  color: isCompleted || isUnlocked
                      ? Colors.white
                      : AppColors.TextColor1.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
