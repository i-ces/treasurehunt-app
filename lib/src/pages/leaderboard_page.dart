import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/leaderboard_component.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  static final List<Map<String, dynamic>> dalloData =
      List.generate(16, (index) {
    return {
      'name': 'Error 404',
      'position': '#${index + 1}',
      'dalloColor': const Color(0xff233974),
      'dalloContentColor': const Color(0xffffffff),
    };
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarHeight: 200, name: '', showDallo: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LeaderboardComponent(
                            teamname: '123',
                            containerHeight: 120,
                            containerWidth: 100,
                            circleHeight: 100,
                            circleWidth: 100,
                            smallCircleWidth: 30,
                            smallCircleHeight: 30,
                            containerPaddingFromTop: EdgeInsets.only(top: 50),
                            positionSmallCircle: 60 / 2,
                            smallCircleText: '#2',
                          ),
                          LeaderboardComponent(
                            teamname: 'Error 404',
                          ),
                          LeaderboardComponent(
                            teamname: '678',
                            containerHeight: 120,
                            containerWidth: 100,
                            circleHeight: 100,
                            circleWidth: 100,
                            smallCircleHeight: 30,
                            smallCircleWidth: 30,
                            containerPaddingFromTop: EdgeInsets.only(top: 50),
                            positionSmallCircle: 60 / 2,
                            smallCircleText: '#3',
                          )
                        ],
                      ),
                    ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: FloatingBar(
                    //     name: '234',
                    //     contestant: true,
                    //     position: '#1',
                    //     showElevation: false,
                    //     dalloColor: Color(0xff233974),
                    //     dalloContentColor: Color(0xffffffff)
                    //   ),
                    // ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: FloatingBar(
                    //     name: '456',
                    //     contestant: true,
                    //     position: '#2',
                    //     showElevation: false,
                    //     dalloColor: Color(0xff233974),
                    //     dalloContentColor: Color(0xffffffff),
                    //   ),
                    // ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: FloatingBar(
                    //     name: '789',
                    //     contestant: true,
                    //     position: '#3',
                    //     showElevation: false,
                    //     dalloColor: Color(0xff233974),
                    //     dalloContentColor: Color(0xffffffff)
                    //   ),
                    // ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: FloatingBar(
                    //       name: '56664',
                    //       contestant: true,
                    //       position: '#4',
                    //       showElevation: false,
                    //       dalloColor: Color(0xff233974),
                    //       dalloContentColor: Color(0xffffffff)
                    //       ),

                    // ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: FloatingBar(
                    //       name: '56664',
                    //       contestant: true,
                    //       position: '#4',
                    //       showElevation: false,
                    //       dalloColor: Color(0xff233974),
                    //       dalloContentColor: Color(0xffffffff)
                    //       ),

                    // )
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dalloData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            height: 70,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            decoration: BoxDecoration(
                              color: AppColors.MainColor,
                              borderRadius: BorderRadius.circular(
                                32,
                              ),
                            ),
                            child: const Center(
                              child: Text("#01 Team Diggers",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  )),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
