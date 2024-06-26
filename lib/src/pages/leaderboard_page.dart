import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';
import 'package:treasurehunt/src/widgets/leaderboard_component.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

static final List<Map<String, dynamic>> dalloData = List.generate(16, (index) {
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
      appBar: CustomAppBar(appBarHeight: 200, name: '', showDallo: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
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
                            containerPaddingFromTop: const EdgeInsets.only(top: 50),
                            positionSmallCircle: 60/2,
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
                            containerPaddingFromTop: const EdgeInsets.only(top: 50),
                            positionSmallCircle: 60/2,
                            smallCircleText: '#3',
                          )
                        ],
                      ),
                    ),
                    // const Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    //   child: Dallo(
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
                    //   child: Dallo(
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
                    //   child: Dallo(
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
                    //   child: Dallo(
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
                    //   child: Dallo(
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
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dalloData.length,
                      itemBuilder: (context, index) {
                        final data = dalloData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          child: Dallo(
                            name: data['name'],
                            contestant: true,
                            position: data['position'],
                            showElevation: false,
                            dalloColor: data['dalloColor'],
                            dalloContentColor: data['dalloContentColor'],
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
