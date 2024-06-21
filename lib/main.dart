import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';
import 'package:treasurehunt/src/screens/splash_screen.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatelessWidget {
  const TreasureHuntApp({Key? key}) : super(key: key);

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
