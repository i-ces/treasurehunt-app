import 'dart:convert';

import 'package:treasurehunt/src/models/user.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

class LeaderboardHandler {
  static Future<List<User>> get() async {
    final response = await ApiMiddleware.get('/leaderboard');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      try {
        List<User> users = [];
        for (var user in data) {
          users.add(User.fromJson(user['user']));
        }
        print("uses length: ${users.length}");

        return users;
      } catch (e) {
        throw 'Couldn\'t get leaderboard';
      }
    } else {
      throw 'Couldn\'t get leaderboard';
    }
  }

  static Future<int> currentLevel() async {
    try {
      final response = await ApiMiddleware.get('/myposition');

      int level = jsonDecode(response.body)['level_id'];
      print("level = $level");
      return level;
    } catch (e) {
      print("Erro fetching my position: ${e}");
      return 0;
    }
  }
}
