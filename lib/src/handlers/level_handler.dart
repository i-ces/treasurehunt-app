import 'dart:convert';

import 'package:treasurehunt/src/models/level.dart';
import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

class LevelHandler {
  static Future<List<Level>> getAllLevels() async {
    final response = await ApiMiddleware.get("/levels");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print("LEVELS: $data");
      return data.map((e) => Level.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch levels");
    }
  }

  static Future<List<Riddle>> getLevel(int id) async {
    final response = await ApiMiddleware.get("/riddles?level_id=$id");

    print("Level wise riddles: ${response.body}");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Riddle> riddles = [];
      for (var riddle in data) {
        riddles.add(Riddle.fromJson(riddle));
      }
      return riddles;
    } else {
      throw Exception("Failed to fetch level");
    }
  }
}
