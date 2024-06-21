import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Removes the back button if needed
      flexibleSpace: Container(
        height: MediaQuery.of(context).size.height * 0.5,
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
          padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo-white.png', // Path to your second logo
                    height: 30.0,
                  ),
                   const SizedBox(width: 150.0),
                  Image.asset(
                    'assets/images/i-ces_logo.png', // Path to your first logo
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
