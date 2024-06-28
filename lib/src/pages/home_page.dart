import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/leaderboard_handler.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';

enum Level { zero, one, two, three, four, five, six, seven, eight, nine, ten }

class HomePage extends StatefulWidget {
  const HomePage({
    this.level = 0,
    super.key,
  });
  final int level;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _level = 0;

  fetch() async {
    setState(() async {
      _level = await LeaderboardHandler.currentLevel();
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    String getImage(int currentLevel) {
      switch (_level) {
        case 0:
          return 'Level-00.png';
        case 1:
          return 'Level-01.png';
        case 2:
          return 'Level-02.png';
        case 3:
          return 'Level-03.png';
        case 4:
          return 'Level-04.png';
        case 5:
          return 'Level-05.png';
        case 6:
          return 'Level-06.png';
        case 7:
          return 'Level-07.png';
        case 8:
          return 'Level-08.png';
        case 9:
          return 'Level-09.png';
        case 10:
          return 'Level-10.png';
        default:
          return 'Level-00.png';
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
          appBarHeight: 200,
          name: 'Your RoadMap For Treasure Hunt',
          showDallo: true),
      body: SingleChildScrollView(
        child: Image.asset(
          "assets/images/${getImage(_level)}",
        ),
      ),
    );
  }
}
