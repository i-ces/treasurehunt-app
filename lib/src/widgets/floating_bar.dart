import 'package:flutter/material.dart';

class FloatingBar extends StatelessWidget {
  final String name;
  final bool showBackButton;
  final void Function() onBackPressed;

  const FloatingBar({
    required this.name,
    this.showBackButton = false,
    required this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (showBackButton)
              IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => {
                        onBackPressed(),
                      }
                  // Navigator.of(context).pop(),
                  ),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(fontSize: 20),
                textAlign: showBackButton ? TextAlign.start : TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
