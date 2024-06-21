import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';
import 'package:treasurehunt/src/screens/welcome_screen.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 230,
              right: -25,
              child: Transform.rotate(
                angle: -45 * 3.1415927 / 180, // Rotate -45 degrees
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.orange, // Set icon color to orange
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Coders!",
                        style: TextStyle(fontSize: 24.0, color: Colors.black),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Team Name',
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                            color: Colors.orange, // Set icon color to orange
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            CupertinoIcons.lock,
                            color: Colors.orange, // Set icon color to orange
                          ),
                          suffixIcon: Icon(
                            CupertinoIcons.eye,
                            color: Colors.orange, // Set icon color to orange
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 148.0),
                      Column(
                        children: [
                          CustomButton(
                            text: 'LOGIN',
                            onPressed: () {
                              // Navigate to verified screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "<Remember to follow the owl",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
