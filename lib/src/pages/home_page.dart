import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/widgets/accordion.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; 

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    child: SvgPicture.asset(
                      'images/home-bg.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  FloatingBar(name: 'The Road to Mr. Umi', onBackPressed: (){}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
