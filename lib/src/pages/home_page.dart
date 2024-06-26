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
      appBar: CustomAppBar(appBarHeight: 200, name: 'The road to Mr. Uni', showDallo: true),
      body: Column(
        children: [
          // Dallo(name: 'The Road to Mr. Umi'),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: width,
                child: SvgPicture.asset(
                  'assets/images/home-bg.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
