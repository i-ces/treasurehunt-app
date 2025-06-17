import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

enum Status { congratulations, ohno, danger }

class CorrectAns extends StatefulWidget {
  final Status status;

  const CorrectAns({super.key, required this.status});

  @override
  State<CorrectAns> createState() => _CorrectAnsState();
}

class _CorrectAnsState extends State<CorrectAns> {
  @override
  Widget build(BuildContext context) {
    String text;
    String subtext;
    String imagePath;

    switch (widget.status) {
      case Status.congratulations:
        text = "Congratulations!";
        imagePath = 'assets/images/Tick.png';
        subtext =
            "You’re one step closure to finding \n the whereabouts of Mr. Umi";
        break;
      case Status.ohno:
        text = "Oh no!";
        imagePath = 'assets/images/cross.png';
        subtext =
            "Looks like you made an oopsie! Please check\n the riddles carefully and answer again!";
        break;
      case Status.danger:
        text = "Danger!";
        imagePath = 'assets/images/trap.png';
        subtext =
            "Looks like you’ve encountered a trap! Please move a step back!";
        break;
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: FloatingBar(
          //     name: 'Riddle #01',
          //     onBackPressed: () {},
          //   ),
          // ), //replace this with the riddle id
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/Logo-Owl-Only.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(imagePath),
                  const SizedBox(height: 30),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 28,
                      color: AppColors.MainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subtext,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 89, 118, 167),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                      text: 'Next',
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
