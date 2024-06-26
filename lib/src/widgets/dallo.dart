import 'package:flutter/material.dart';

class Dallo extends StatelessWidget {
  final String name;
  final bool showBackButton;
  final bool contestant;
  final String position;
  final bool showElevation;
  final Color dalloColor;
  final Color dalloContentColor;

  const Dallo({
    required this.name,
    this.showBackButton = false,
    this.contestant = false,
    this.position = '',
    this.showElevation = true,
    this.dalloColor = const Color.fromRGBO(255, 255, 255, 1),
    this.dalloContentColor = const Color.fromARGB(7, 0, 8, 14),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: dalloColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48.0),
      ),
      elevation: showElevation ? 10 : 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            if (showBackButton)
              IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => {}
                  // Navigator.of(context).pop(),
                  ),
            if(contestant)
            
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    position,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xffffffff)
                      ),))),
            
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: dalloContentColor,
                    ),
                    // background: #090F4780;
    
                  textAlign: showBackButton ? TextAlign.start : TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
