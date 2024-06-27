import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget? widget;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.AccentColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
        ),
        child: widget != null
            ? widget
            : Text(
                text.toUpperCase(),
                style: const TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
