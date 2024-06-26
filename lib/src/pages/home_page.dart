import 'package:flutter/material.dart';

enum Level { zero, one, two, three, four, five, six, seven, eight, nine, ten }

class HomePage extends StatelessWidget {
  const HomePage({
    this.level = Level.zero,
    super.key,
  });
  final Level level;

  @override
  Widget build(BuildContext context) {
    String getImage(Level currentLabel) {
      switch (currentLabel) {
        case Level.zero:
          return 'Level-00.png';
        case Level.one:
          return 'Level-01.png';
        case Level.two:
          return 'Level-02.png';
        case Level.three:
          return 'Level-03.png';
        case Level.four:
          return 'Level-04.png';
        case Level.five:
          return 'Level-05.png';
        case Level.six:
          return 'Level-06.png';
        case Level.seven:
          return 'Level-07.png';
        case Level.eight:
          return 'Level-08.png';
        case Level.nine:
          return 'Level-09.png';
        case Level.ten:
          return 'Level-10.png';
        default:
          return 'Level-00.png';
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Image.asset(
          "assets/images/${getImage(level)}",
        ),
      ),
    );
  }
}
