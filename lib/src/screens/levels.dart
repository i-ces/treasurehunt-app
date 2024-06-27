import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/riddle_handler.dart';
import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({super.key});

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  late Future<Riddle> futureRiddle;

  @override
  void initState() {
    super.initState();
    futureRiddle =
        RiddleHandler().getRiddle(1, 1); // Example level and riddle IDs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Riddle>(
        future: futureRiddle,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading riddle'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No riddle found'));
          } else {
            final riddle = snapshot.data!;
            return Scaffold(
              appBar: CustomAppBar(
                showDallo: true,
                showBackButtonInDallo: true,
                name: 'Riddle-${riddle.riddle_id}',
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Riddle-${riddle.riddle_id}",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(color: AppColors.AccentColor),
                      Text(
                        riddle.question,
                        style: const TextStyle(
                          color: AppColors.TextColor2,
                          fontSize: 18,
                        ),
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
                                widthFactor:
                                    0.8, // Adjust the width factor as needed
                                child: Container(
                                  width: double
                                      .infinity, // Make the container take full width
                                  height: 150, // Adjust the height as needed
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/logo-blue.png'),
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
                                    color: Colors
                                        .white, // Adjust text color as needed
                                    fontSize: 20,
                                  ),
                                  cursorColor: Colors
                                      .blue, // Adjust cursor color as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomButton(
                        text: 'Submit',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
