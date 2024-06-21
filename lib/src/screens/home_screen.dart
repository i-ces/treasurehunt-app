import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/nav_bar.dart';

import '../pages/home_page.dart';
import '../pages/leaderboard_page.dart';
import '../pages/riddles.dart';
import '../pages/sponsor.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    HomePage(),
    LeaderboardPage(),
    RiddlesPage(),
    SponsorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavBar(
        onItemSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
