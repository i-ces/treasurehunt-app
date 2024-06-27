import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

class RiddleHandler {
  Future<Riddle> getRiddle(
    final int level,
    final int riddle,
  ) async {
    try {
      final response = await ApiMiddleware.get('/level/$level/riddles/$riddle');
      final data = jsonDecode(response.body);
      return Riddle.fromJson(data);
    } catch (_) {
      rethrow;
    }
  }

  static Future<int> userLevel() async {
    final response = await ApiMiddleware.get('/user-progress');

    if (response.statusCode == 200) {
      return jsonDecode(response.body)[0]['current_level'];
    } else {
      if (kDebugMode) print('ERROR: ${response.body}');
      throw 'Couldn\'t get user level';
    }
  }
}
