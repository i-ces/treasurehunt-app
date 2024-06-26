import 'package:flutter/material.dart';
import 'package:treasurehunt/src/pages/home_page.dart';
import 'package:treasurehunt/src/screens/home_screen.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> with SingleTickerProviderStateMixin {
  bool _isRevealed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  void _revealHomePage() {
    setState(() {
      _isRevealed = true;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Text(
              'Animated Screen',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            top: _isRevealed ? -MediaQuery.of(context).size.height : 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.blue,
              child: Center(
                child: ElevatedButton(
                  onPressed: _revealHomePage,
                  child: Text('Reveal Home Page'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
