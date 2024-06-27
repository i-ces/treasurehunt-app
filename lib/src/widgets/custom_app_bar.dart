import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String name;
  final bool showDallo;
  final bool showBackButtonInDallo;
  final void Function()? onBackPressedInDallo;

  const CustomAppBar({
    super.key,
    this.appBarHeight = 250,
    this.name = "",
    this.showDallo = false,
    this.showBackButtonInDallo = false,
    this.onBackPressedInDallo,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // padding: EdgeInsets.only(top: 30),
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 42, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/logo-white.svg',
                  width: width * 0.3,
                  fit: BoxFit.contain,
                ),
                SvgPicture.asset(
                  'assets/images/ices-logo.svg',
                  width: width * 0.22,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        if (showDallo)
          Positioned(
            bottom: -25,
            child: DalloContainer(
                name: name,
                showBackButtonInDallo: showBackButtonInDallo,
                onBackPressedInDallo: onBackPressedInDallo),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class DalloContainer extends StatelessWidget {
  final String name;
  final bool showBackButtonInDallo;
  final void Function()? onBackPressedInDallo;
  const DalloContainer(
      {super.key,
      required this.name,
      required this.showBackButtonInDallo,
      this.onBackPressedInDallo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: FloatingBar(
        name: name,
        dalloContentColor: const Color(0xff233974),
        showBackButton: showBackButtonInDallo,
        onBackPressed: onBackPressedInDallo,
      ),
    );
  }
}
