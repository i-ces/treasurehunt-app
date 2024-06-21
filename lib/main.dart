import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/splash_screen.dart';

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
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        iconTheme: const IconThemeData(
          color: Colors.orange,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
