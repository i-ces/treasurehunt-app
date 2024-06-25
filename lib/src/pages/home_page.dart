import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/widgets/dallo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: width,
                    child: SvgPicture.asset(
                      'assets/images/home-bg.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Dallo(
                    name: 'The Road to Mr. Umi',
                    onBackPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
