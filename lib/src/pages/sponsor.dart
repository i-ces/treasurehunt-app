import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/sponsors_data.dart';
import 'package:treasurehunt/src/widgets/accordion.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/floating_bar.dart';

class SponsorsPage extends StatelessWidget {
  const SponsorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        appBarHeight: 200,
        name: 'Get to know our sponsors!',
        showDallo: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
              itemCount: sponsors.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Accordion(
                    sponsorName: sponsors[index]['name']!,
                    sponsorImage: sponsors[index]['image']!,
                    sponsorDescription: sponsors[index]['description']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
