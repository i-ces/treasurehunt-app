import 'package:flutter/material.dart';
import 'package:treasurehunt/src/utils/colors.dart';
import 'package:treasurehunt/src/widgets/custom_app_bar.dart';
import 'package:treasurehunt/src/widgets/dallo.dart';
import 'package:treasurehunt/src/widgets/nav_bar.dart';
import 'dart:async';
import 'package:treasurehunt/src/pages/riddles.dart';

class RiddleDetailPage extends StatefulWidget {
  final String riddleTitle;
  final int riddleNumber;

  const RiddleDetailPage({Key? key, required this.riddleTitle, required this.riddleNumber}) : super(key: key);

  @override
  State<RiddleDetailPage> createState() => _RiddleDetailPageState();
}

class _RiddleDetailPageState extends State<RiddleDetailPage> {

  late Future<String> riddleDescriptionFuture;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    riddleDescriptionFuture = fetchRiddleDescription();
  }
  Future<String> fetchRiddleDescription() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    return 'Description for ${widget.riddleTitle} from API'; // Replace with actual API call
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  CustomAppBar(appBarHeight: 80),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Dallo(
            name: 'Riddle ${widget.riddleNumber}',
            showBackButton: true,
            onBackPressed: () => Navigator.of(context).pop(),
          ),
          Expanded(
            child: FutureBuilder<String>(
              future: fetchRiddleDescription(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No description available'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      snapshot.data!,
                      style: const TextStyle(fontSize: 18, color: AppColors.TextColor1),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          int _selectedIndex = 2;

          void _onItemTapped(int index) {
            setState(() {
              _selectedIndex = index;
            });
          }

          return NavBar(
            onItemSelected: _onItemTapped,
            selectedIndex: _selectedIndex,
          );
        },
      ),
    );
  }
}
