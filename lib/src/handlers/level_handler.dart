import 'dart:convert';

import 'package:treasurehunt/src/models/level.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

class LevelHandler {
  static Future<List<Level>> getAllLevels() async {
    final response = await ApiMiddleware.get("/levels");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Level.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch levels");
    }
  }
}
