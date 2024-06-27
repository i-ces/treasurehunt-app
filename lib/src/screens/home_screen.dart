import 'package:flutter/material.dart';
import 'package:treasurehunt/src/pages/home_page.dart';
import 'package:treasurehunt/src/pages/leaderboard_page.dart';
import 'package:treasurehunt/src/pages/level.dart';
import 'package:treasurehunt/src/pages/sponsor.dart';
import 'package:treasurehunt/src/utils/services/token_service.dart';
import 'package:treasurehunt/src/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  int userlevel = 0;

  void fetchUserLevel() async {
    final level = await getUserLevel();
    setState(() {
      userlevel = level;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUserLevel();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomePage(level: userlevel),
      const LeaderboardPage(),
      LevelPage(level: userlevel),
      const SponsorsPage(),
    ];

    return Scaffold(
      // appBar:  CustomAppBar(appBarHeight: 200),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavBar(
        onItemSelected: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
