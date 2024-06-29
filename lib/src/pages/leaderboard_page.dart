import 'package:flutter/material.dart';
import 'package:treasurehunt/src/handlers/leaderboard_handler.dart';
import 'package:treasurehunt/src/models/user.dart';
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
    print("leaderboard page");
    return Scaffold(
      appBar: const CustomAppBar(
          appBarHeight: 200, name: 'Leaderboard', showDallo: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, top: 20),
                child: FutureBuilder(
                  future: LeaderboardHandler.get(),
                  builder: (context, snapshot) {
                    print("inside");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'An error occurred ${snapshot.error.toString()}',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 18),
                        ),
                      );
                    } else if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'No data available',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      final leader1 = snapshot.data![0] as User;
                      final leader2 = snapshot.data![1] as User;
                      final leader3 = snapshot.data![2] as User;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 22.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                LeaderboardComponent(
                                  teamname: "Team \n${leader2.name}",
                                  containerHeight: 120,
                                  containerWidth: 100,
                                  circleHeight: 100,
                                  circleWidth: 100,
                                  smallCircleWidth: 30,
                                  smallCircleHeight: 30,
                                  containerPaddingFromTop:
                                      const EdgeInsets.only(top: 50),
                                  positionSmallCircle: 60 / 2,
                                  smallCircleText: '#2',
                                  image: leader2.image!,
                                ),
                                LeaderboardComponent(
                                  teamname: "Team \n${leader1.name}",
                                  image: leader1.image!,
                                ),
                                LeaderboardComponent(
                                  teamname: "Team \n${leader3.name}",
                                  containerHeight: 120,
                                  containerWidth: 100,
                                  circleHeight: 100,
                                  circleWidth: 100,
                                  smallCircleHeight: 30,
                                  smallCircleWidth: 30,
                                  containerPaddingFromTop:
                                      const EdgeInsets.only(top: 50),
                                  positionSmallCircle: 60 / 2,
                                  smallCircleText: '#3',
                                  image: leader3.image!,
                                ),
                              ],
                            ),
                          ),
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   itemCount: snapshot.data!.length - 3,
                          //   itemBuilder: (context, index) {
                          //     final leader = snapshot.data![index + 3] as User;
                          //     return Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 20, vertical: 10),
                          //       child: Container(
                          //         height: 70,
                          //         padding: const EdgeInsets.symmetric(
                          //             vertical: 12.0, horizontal: 24.0),
                          //         decoration: BoxDecoration(
                          //           color: AppColors.MainColor,
                          //           borderRadius: BorderRadius.circular(
                          //             32,
                          //           ),
                          //         ),
                          //         child: Center(
                          //           child: Text(
                          //               "#${index + 4} Team ${leader.name}",
                          //               overflow: TextOverflow.ellipsis,
                          //               maxLines: 1,
                          //               style: TextStyle(
                          //                 color: Colors.white,
                          //                 fontSize: 24,
                          //               )),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
