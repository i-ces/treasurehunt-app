import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/level_handler.dart';
import 'package:treasurehunt/src/screens/riddle_page.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';

class LevelDetailPage extends StatelessWidget {
  final String levelTitle;
  final int levelNumber;

  const LevelDetailPage(
      {super.key, required this.levelTitle, required this.levelNumber});

  Future<String> fetchRiddleDescription() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return 'Description for $levelTitle from API'; // Replace with actual API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarHeight: 200,
        name: 'Level $levelNumber',
        showDallo: true,
        showBackButtonInDallo: true,
        onBackPressedInDallo: () => Navigator.of(context).pop(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: LevelHandler.getLevel(levelNumber + 1),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No description available',
                          style: TextStyle(fontSize: 18)));
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            levelTitle,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ), // Replace this with the riddles id from api

                        const Divider(color: AppColors.AccentColor),
                        const SizedBox(height: 20),

                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                crossAxisSpacing: 20,
                              ),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => RiddlePage(
                                                  levelNumber,
                                                  snapshot.data![index].id,
                                                )));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Text(
                                      'Riddle #${index + 1}',
                                      style: TextStyle(
                                          color:
                                              AppColors.TextColor2.withOpacity(
                                                  0.5),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
