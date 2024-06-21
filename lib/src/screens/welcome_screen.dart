import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treasurehunt/src/screens/login_screen.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/fluidshape.svg',
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SvgPicture.asset(
                  'assets/images/logo-word.svg',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Hack & Hunt!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(66, 65, 66, 1),
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'A Mysterious Adventure for Those\nWho Speak the Language of Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(9, 15, 71, 0.5),
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
