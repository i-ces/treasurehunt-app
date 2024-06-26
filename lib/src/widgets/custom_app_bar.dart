import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  const CustomAppBar({super.key, this.appBarHeight = 145});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: appBarHeight,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.AppBarColor1, AppColors.AppBarColor2],
                stops: [0.2, 0.9],
                begin: Alignment(0.0, 0.0),
                end: Alignment(1.0, 1.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(42.0),
                bottomRight: Radius.circular(42.0),
              ),
            ),
          ),
          Positioned(
            top: 20,
            bottom: 0,
            left: 20.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset(
                'assets/images/logo-white.svg',
                width: width * 0.3,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 30,
            bottom: 0,
            right: 20.0,
            child: Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                'assets/images/ices-logo.svg',
                width: width * 0.22,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
