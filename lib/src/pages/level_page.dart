import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/level_handler.dart';
import 'package:treasurehunt/src/screens/level_detail_page.dart';

import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_riddle_card.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({this.level = 0, super.key});
  final int level;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  final List<String> riddles =
      List.generate(9, (index) => 'Level #0${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarHeight: 200,
        name: 'Levels',
        showDallo: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
            future: LevelHandler.getAllLevels(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        snapshot.data![index].status == 'locked' ||
                                snapshot.data![index].status == 'solved'
                            ? null
                            : Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LevelDetailPage(
                                    levelTitle: snapshot.data![index].title,
                                    levelNumber: snapshot.data![index].level,
                                  ),
                                ),
                              );
                      },
                      child: CustomRiddleCard(
                        riddle: snapshot.data![index].title,
                        id: snapshot.data![index].level,
                        isCompleted: snapshot.data![index].status == 'solved',
                        isUnlocked: snapshot.data![index].status == 'current',
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                    child: Text("Failed to fetch levels",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        )));
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
