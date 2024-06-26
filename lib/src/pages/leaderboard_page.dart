import 'package:flutter/material.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/dallo.dart';
import 'package:treasurehunt/src/widgets/leaderboard_component.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(appBarHeight: 200, name: '', showDallo: false),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LeaderboardComponent(teamname: '123', containerHeight: 120, containerWidth: 100, circleHeight: 100, circleWidth: 100,),
                          LeaderboardComponent(teamname: 'Error 404', ),
                          LeaderboardComponent(teamname: '678', containerHeight: 120, containerWidth: 100, circleHeight: 100, circleWidth: 100,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Dallo(name: '234', contestant: true, position: '#1', showElevation: false, dalloColor: Color(0xff233974),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Dallo(name: '456', contestant: true, position: '#2', showElevation: false, dalloColor: Color(0xff233974),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Dallo(name: '789', contestant: true, position: '#3', showElevation: false, dalloColor: Color(0xff233974),),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Dallo(name: '56664', contestant: true, position: '#4', showElevation: false, dalloColor: Color(0xff233974)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: Dallo(name: '56664', contestant: true, position: '#4', showElevation: false, dalloColor: Color(0xff233974)),
                    )
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),);
  }
}
