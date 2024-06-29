import 'package:flutter/material.dart';

class LeaderboardComponent extends StatelessWidget {
  final String teamname;
  final double? containerHeight;
  final double? containerWidth;
  final double? circleHeight;
  final double? circleWidth;
  final EdgeInsetsGeometry containerPaddingFromTop;
  final double? smallCircleHeight;
  final double? smallCircleWidth;
  final double? positionSmallCircle;
  final String smallCircleText;
  final String image;

  const LeaderboardComponent(
      {super.key,
      required this.teamname,
      required this.image,
      this.containerHeight,
      this.smallCircleText = '#1',
      this.containerWidth,
      this.circleHeight,
      this.circleWidth,
      this.containerPaddingFromTop = const EdgeInsets.only(top: 80),
      this.positionSmallCircle,
      this.smallCircleHeight,
      this.smallCircleWidth});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Image.asset('assets/images/random.png'),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 70),
            height: containerHeight ?? 177,
            width: containerWidth ?? 138,
            decoration: const BoxDecoration(
                color: Color(0xffE1E1E1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(teamname,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0xff090F47),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  )),
            ),
          ),
        ),
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: circleHeight ?? 138,
                width: circleWidth ?? 138,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xffFBAE40), width: 8),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: -15,
                left: positionSmallCircle ?? 100 / 2,
                child: Container(
                  height: smallCircleHeight ?? 41,
                  width: 41,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFBAE40),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        smallCircleText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
