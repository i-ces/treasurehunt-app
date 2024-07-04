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
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: (MediaQuery.sizeOf(context).height - 200) *
                                  0.4),
                          child: const CircularProgressIndicator(),
                        ),
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
                                LeaderboardHeader(
                                    leader2.name!, 2, leader2.image!),
                                LeaderboardHeader(
                                    leader1.name!, 1, leader1.image!,
                                    isFirst: true),
                                LeaderboardHeader(
                                    leader3.name!, 3, leader3.image!),

                                // LeaderboardComponent(
                                //   teamname: "Team \n${leader2.name}",
                                //   containerHeight: 120,
                                //   containerWidth: 100,
                                //   circleHeight: 100,
                                //   circleWidth: 100,
                                //   smallCircleWidth: 30,
                                //   smallCircleHeight: 30,
                                //   containerPaddingFromTop:
                                //       const EdgeInsets.only(top: 50),
                                //   positionSmallCircle: 60 / 2,
                                //   smallCircleText: '#2',
                                //   image: leader2.image!,
                                // ),
                                // LeaderboardComponent(
                                //   teamname: "Team \n${leader1.name}",
                                //   image: leader1.image!,
                                //   isFirst: true,
                                // ),
                                // LeaderboardComponent(
                                //   teamname: "Team \n${leader3.name}",
                                //   containerHeight: 120,
                                //   containerWidth: 100,
                                //   circleHeight: 100,
                                //   circleWidth: 100,
                                //   smallCircleHeight: 30,
                                //   smallCircleWidth: 30,
                                //   containerPaddingFromTop:
                                //       const EdgeInsets.only(top: 50),
                                //   positionSmallCircle: 60 / 2,
                                //   smallCircleText: '#3',
                                //   image: leader3.image!,
                                // ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 0),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length - 3,
                            itemBuilder: (context, index) {
                              final leader = snapshot.data![index + 3] as User;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Container(
                                  height: 90,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.MainColor,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 90,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  width: 3,
                                                  color: AppColors.AccentColor,
                                                )),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  leader.image!,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          Positioned(
                                            bottom: -10,
                                            right: -10,
                                            child: Container(
                                              padding: const EdgeInsets.all(4),
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.AccentColor,
                                              ),
                                              child: FittedBox(
                                                child: Text("#${index + 4}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 20),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width:
                                            MediaQuery.sizeOf(context).width -
                                                170,
                                        // width: double.infinity,
                                        child: Text(leader.name!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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

class LeaderboardHeader extends StatelessWidget {
  final String name;
  final int rank;
  final bool isFirst;
  final String image;
  const LeaderboardHeader(this.name, this.rank, this.image,
      {this.isFirst = false, super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    final width = isFirst ? deviceWidth * 0.3 : deviceWidth * 0.25;
    final double height = isFirst ? 180 : 120;
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            height: height,
            width: width,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColors.FadedGrey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: Text("Team\n$name",
                style: const TextStyle(
                    color: Color(0xff090F47),
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
          ),
          Positioned(
            top: -(width) / 2,
            child: Container(
                height: width,
                width: width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.AccentColor,
                    width: isFirst ? 7 : 5,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(image, fit: BoxFit.cover),
                )),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: (width / 2) - 30,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffFBAE40),
              ),
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  child: Text(
                    "#$rank",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
