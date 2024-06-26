import 'package:flutter/material.dart';
import 'package:treasurehunt/src/pages/home_page.dart';
import 'package:treasurehunt/src/pages/leaderboard_page.dart';
import 'package:treasurehunt/src/pages/riddles.dart';
import 'package:treasurehunt/src/pages/sponsor.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomePage(),
    const LeaderboardPage(),
    RiddlesPage(),
    const SponsorsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavBar(
        onItemSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
