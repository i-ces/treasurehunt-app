import 'package:flutter/material.dart';

class LeaderboardComponent extends StatelessWidget {
  final String teamname;
  final double ?containerHeight;
  final double ?containerWidth;
  final double ?circleHeight;
  final double ?circleWidth;
  final double ?containerPaddingFromTop;
  const LeaderboardComponent({Key? key, required this.teamname, this.containerHeight, this.containerWidth, this.circleHeight, this.circleWidth, this.containerPaddingFromTop});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Image.asset('assets/images/random.png'),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 70),
            height: containerHeight??177,
            width: containerWidth??138,
            decoration: const BoxDecoration(
            color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0.5),
              child: Align(
                alignment: Alignment.center,
                child: Text(teamname, style:  const TextStyle(color: Color(0xff090F47), fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 21))),
            ),
          ),
        ),
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
            Container(
            height: circleHeight ??138,
            width: circleWidth?? 138,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xffFBAE40), width: 8),
              image: const DecorationImage(image: AssetImage('assets/images/random.png'))
            ),
          ),
          Positioned(
            bottom: -20,
            left: (circleWidth??100)/2,
            child: Container(
              height: 41,
              width:41,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFBAE40),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: const Text('#1', style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),),
              ),
            ),
          )
          ],),
        )
      ],
    );
  }
}