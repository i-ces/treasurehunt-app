import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class NavBar extends StatefulWidget {
  final void Function(int) onItemSelected;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        // color: AppColors.AccentColor,
        size: 20,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: buildNavIcon(0, 'home.png', widget.selectedIndex),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(1, 'leaderboard.png', widget.selectedIndex),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(2, 'hack.png', widget.selectedIndex, isLogo: true),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(3, 'riddles.png', widget.selectedIndex),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: buildNavIcon(4, 'sponsors.png', widget.selectedIndex),
          label: '',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColors.AccentColor,
      onTap: widget.onItemSelected,
    );
  }

  Widget buildNavIcon(int index, String name, int selectedIndex,
      {bool isLogo = false}) {
    final isSelected = index == selectedIndex;
    return Image.asset(
      'assets/icons/$name',
      height: isLogo ? 40 : 24,
      width: isLogo ? 40 : 24,
      color: (isLogo || !isSelected) ? null : Colors.orange[700],
    );
  }
}
