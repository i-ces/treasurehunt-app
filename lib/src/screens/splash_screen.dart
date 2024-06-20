import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
      const Duration(microseconds: 1500),
      () {},
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

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
