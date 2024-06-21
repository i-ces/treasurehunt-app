import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Removes the back button if needed
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.AppBarColor2, AppColors.AppBarColor1],
            begin: Alignment(0.0,0.0),
            end: Alignment(1.0,1.0),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/logo-white.png', // Path to your second logo
                    height: 30.0,
                  ),
                   const SizedBox(width: 150.0),
                  Image.asset(
                    'images/i-ces_logo.png', // Path to your first logo
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      elevation: 0, // Remove shadow if needed
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
