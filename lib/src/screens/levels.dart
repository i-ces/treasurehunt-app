import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dallo(
              name: 'Riddle #001',
              onBackPressed: () {},
            ),
            const SizedBox(height: 20),
            const Text(
              "Level-01",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Replace this with the riddles id from api
            const Divider(color: AppColors.AccentColor),
            const Text(
              "To start a journey full of fun,\nFind the place where news is spun.\nLook for the latest club's delight,\nOn platforms where we share our sight.\nSeek the post that starts the quest,\nFollow the link, be our guest.",
              style: TextStyle(color: AppColors.TextColor2, fontSize: 18),
            ),
            const Divider(color: AppColors.AccentColor),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background image
                    FractionallySizedBox(
                      widthFactor: 0.8, // Adjust the width factor as needed
                      child: Container(
                        width: double
                            .infinity, // Make the container take full width
                        height: 150, // Adjust the height as needed
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/logo-blue.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    // TextFormField
                    Container(
                      width: 300, // Adjust the width as needed
                      height: 200, // Adjust the height as needed
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 29, 27, 27)
                            .withOpacity(0.9), // Background color
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        // controller: _controller,
                        maxLines: null, // Allow multiple lines
                        decoration: InputDecoration(
                          hintText: 'Write your answer.....',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(
                                0.6), // Adjust label text color as needed
                          ),
                          border: InputBorder.none, // Remove border
                        ),
                        style: const TextStyle(
                          color: Colors.white, // Adjust text color as needed
                        ),
                        cursorColor:
                            Colors.blue, // Adjust cursor color as needed
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(text: 'Submit', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: LevelsPage()));
