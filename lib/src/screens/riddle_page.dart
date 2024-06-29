import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/riddle_handler.dart';
import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/screens/correct_ans.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

class RiddlePage extends StatefulWidget {
  const RiddlePage(this.level, this.riddle, {super.key});
  final int level;
  final int riddle;

  @override
  State<RiddlePage> createState() => _RiddlePageState();
}

class _RiddlePageState extends State<RiddlePage> {
  final TextEditingController _controller = TextEditingController();

  void submitAnswer(String answer) async {
    try {
      final status = await RiddleHandler.checkAnswer(answer, widget.riddle);
      if (status == 'correct') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CorrectAns(status: Status.congratulations)));
      } else if (status == 'incorrect') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CorrectAns(status: Status.ohno)));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CorrectAns(status: Status.danger)));
      }
    } catch (e) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CorrectAns(status: Status.danger)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CustomAppBar(
          showDallo: true,
          showBackButtonInDallo: true,
          name: 'Level ${widget.level}',
        ),
        body: FutureBuilder<Riddle>(
          future: RiddleHandler.getRiddle(widget.level, widget.riddle),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading riddle: '));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No riddle found'));
            } else {
              final riddle = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Riddle-${riddle.id}",
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
                        padding: const EdgeInsets.all(0.0),
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
                                width: double
                                    .infinity, // Adjust the width as needed
                                height: 200, // Adjust the height as needed
                                padding: const EdgeInsets.all(
                                    8.0), // Adjust the padding as needed
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 29, 27, 27)
                                      .withOpacity(0.9), // Background color
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: TextFormField(
                                  controller: _controller,
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
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Submit',
                        onPressed: () => submitAnswer(_controller.text.trim()),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
