import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBAE40),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            width: MediaQuery.of(context).size.width * .3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class InverseSplashScreen extends StatelessWidget {
  const InverseSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            width: MediaQuery.of(context).size.width * .3,
          ),
        ),
      ),
    );
  }
}
