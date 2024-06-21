import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: Column(
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
                  icon: Icon(Icons.arrow_back,),
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
                    style: TextStyle(fontSize: 24.0),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Team Name',
                      prefixIcon: Icon(CupertinoIcons.person),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(CupertinoIcons.lock),
                        suffixIcon: Icon(CupertinoIcons.eye)),
                    obscureText: true,
                  ),
                  SizedBox(height: 16.0),

                  // Add image using image asset
                  Container(
                    padding: EdgeInsets.only(left: 272),
                    child: Image.asset(
                      'assets/images/Logo-Owl-Only.png',
                      width: 150, // Adjust the width as needed
                      height: 150, // Adjust the height as needed
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Replace this elevated button with Custom Button and size will be adjust accordingly
                  Center(
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'LOGIN',
                          onPressed: () {
                            // Navigate to verfied screen

                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const HomeScreen(),
                            //   ),
                            // );
                          },
                        ),
                        Text("<Remember to follow the owl"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
