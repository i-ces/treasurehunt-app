import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/dallo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String name;
  final bool showDallo;

  CustomAppBar({super.key, required this.appBarHeight, required this.name, required this.showDallo});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // padding: EdgeInsets.only(top: 30),
          height: appBarHeight,
          decoration:  BoxDecoration(
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
            ],),
          ),
        ),
      if (showDallo)
       Positioned(
          bottom: -45, 
          child: DalloContainer(name: name),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
class DalloContainer extends StatelessWidget {
  final String name;
  const DalloContainer({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: MediaQuery.of(context).size.width, 
      height: 60, 
      child: Dallo(name: name, dalloContentColor: Color(0xff233974),),
    );
  }
}