import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/screens/welcome_screen.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: AppColors.AccentColor,
      splash: const Splash(
        color: AppColors.FadedGrey,
      ),
      nextScreen: const InverseSplashScreen(),
      splashIconSize: 400,
    );
  }
}

class InverseSplashScreen extends StatelessWidget {
  const InverseSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Splash(),
      nextScreen: const WelcomeScreen(),
      splashIconSize:
          400, // Ensure splashIconSize is also set to ensure full size.
    );
  }
}

class Splash extends StatelessWidget {
  final Color? color;

  const Splash({
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32),
      child: SvgPicture.asset(
        'assets/logo.svg',
        width: double.infinity,
        fit: BoxFit
            .contain, // Use BoxFit.contain or BoxFit.cover depending on the desired scaling behavior.
        color: color,
      ),
    );
  }
}
