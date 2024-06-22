import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';
import 'package:treasurehunt/src/screens/login_screen.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';


class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFFBAE40),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
                      ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SvgPicture.asset(
                    'assets/images/hack&hunt.svg',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  const Text(
                    'Team Verified!',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        color: Color(0xff090F47)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Text(
                    'Congratulations, your account has been verified. You are now eligible for Hack & Hunt!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: Color(0xff0F4780)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.055,
                  ),
                  CustomButton(
                    text: 'CONTINUE',
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width*0.02,
            ),
          const Spacer(), 
            Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  'assets/images/owl.svg',
                  width: MediaQuery.of(context).size.width * 0.334,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
