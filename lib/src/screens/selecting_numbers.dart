import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/levels.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';
import 'package:treasurehunt/src/widgets/nav_bar.dart';

class RiddleDetailPage extends StatelessWidget {
  final String riddleTitle;
  final int riddleNumber;

  const RiddleDetailPage(
      {super.key, required this.riddleTitle, required this.riddleNumber});

  Future<String> fetchRiddleDescription() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return 'Description for $riddleTitle from API'; // Replace with actual API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          FloatingBar(
            name: 'Riddle $riddleNumber',
            showBackButton: true,
            onBackPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            // child:
            //  FutureBuilder<String>(
            //   future: fetchRiddleDescription(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('No description available'));
            //     } else {
            //       return Padding(
            //         padding: const EdgeInsets.all(16.0),
            //         child: Text(
            //           snapshot.data!,
            //           style: const TextStyle(
            //               fontSize: 18, color: AppColors.TextColor1),
            //         ),
            //       );
            //     }
            //   },
            // ),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "The Number’s Dilemma",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LevelsPage()));
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Text(
                                'Riddle #${index + 1}',
                                style: TextStyle(
                                    color:
                                        AppColors.TextColor2.withOpacity(0.5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          int selectedIndex = 2;

          void onItemTapped(int index) {
            setState(() {
              selectedIndex = index;
            });
          }

          return NavBar(
            onItemSelected: onItemTapped,
            selectedIndex: selectedIndex,
          );
        },
      ),
    );
  }
}
