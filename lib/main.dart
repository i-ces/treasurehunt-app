import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';
import 'package:treasurehunt/src/screens/splash_screen.dart';
import 'package:treasurehunt/src/screens/verified_screen.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatefulWidget {
  const TreasureHuntApp({super.key});

  @override
  State<TreasureHuntApp> createState() => _TreasureHuntAppState();
}

class _TreasureHuntAppState extends State<TreasureHuntApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      home: VerifiedScreen(),
    );
  }
}
