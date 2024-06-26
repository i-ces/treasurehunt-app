import 'package:flutter/material.dart';
import 'package:treasurehunt/src/screens/splash_screen.dart';
import 'package:treasurehunt/src/utils/colors.dart';

void main() {
  runApp(const TreasureHuntApp());
}

class TreasureHuntApp extends StatelessWidget {
  const TreasureHuntApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        iconTheme: const IconThemeData(
          color: AppColors.AccentColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
