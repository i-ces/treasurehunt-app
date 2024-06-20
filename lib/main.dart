import 'package:flutter/material.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatefulWidget {
  const TreasureHuntApp({super.key});

  @override
  State<TreasureHuntApp> createState() => _TreasureHuntAppState();
}

class _TreasureHuntAppState extends State<TreasureHuntApp> {
  String _treasureMessage = "Start your treasure hunt!";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Treasure Hunt"),
        ),
        body: Center(
          child: Text(_treasureMessage),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _treasureMessage = "You found a clue!";
            });
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
