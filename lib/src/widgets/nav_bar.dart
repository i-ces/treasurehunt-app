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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: widget.selectedIndex == 0
                ? AppColors.AccentColor
                : AppColors.TextColor2,
          ),
          label: '',
        ),
                BottomNavigationBarItem(
          icon: Icon(
            Icons.assessment_rounded,
            color: widget.selectedIndex == 1
                ? AppColors.AccentColor
                : AppColors.TextColor2,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.assistant_photo_rounded,
            color: widget.selectedIndex == 2
                ? AppColors.AccentColor
                : AppColors.TextColor2,
          ),
          label: '',
        ),

        BottomNavigationBarItem(
          icon: Icon(
            Icons.lightbulb_rounded,
            color: widget.selectedIndex == 3
                ? AppColors.AccentColor
                : AppColors.TextColor2,
          ),
          label: '',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColors.AccentColor,
      onTap: widget.onItemSelected,
    );
  }
}
