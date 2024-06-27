import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:treasurehunt/src/handlers/auth_handler.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/utils/helper_functions.dart';
import 'package:treasurehunt/src/utils/services/token_service.dart';
import 'package:treasurehunt/src/widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> login() async {
    if (_usernameController.text.length < 4 ||
        _passwordController.text.length < 4) {
      return;
    }
    try {
      final token = await AuthHandler.login(
          _usernameController.text, _passwordController.text);
      await storeBearerToken(token);
      final saved_token = await getBearerToken();
      print('saved_token: $saved_token');
      // Go to homescreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      showErrorToast('Failed to login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 230,
            right: -20,
            child: Transform.rotate(
              angle: -45 * 3.1415927 / 180, // Rotate -45 degrees
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: 150,
                height: 150,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                // Row(
                //   children: [
                //     IconButton(
                //       onPressed: () {
                //         Navigator.pushReplacement(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const WelcomeScreen(),
                //           ),
                //         );
                //       },
                //       icon: const Icon(
                //         Icons.arrow_back,
                //         color:
                //             AppColors.AccentColor, // Set icon color to orange
                //       ),
                //     ),
                //   ],
                // ),
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
                            color: AppColors
                                .AccentColor, // Set icon color to orange
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(
                            CupertinoIcons.lock,
                            color: AppColors
                                .AccentColor, // Set icon color to orange
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                              color: AppColors
                                  .AccentColor, // Set icon color to orange
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                        obscureText: _obscureText,
                      ),
                      const SizedBox(height: 168.0),
                      Column(
                        children: [
                          CustomButton(
                            text: 'LOGIN',
                            onPressed: () {
                              login();
                              // Navigate to verified screen
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const HomeScreen(),
                              //   ),
                              // );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "<Remember to follow the owl>",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
