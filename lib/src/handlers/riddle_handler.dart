import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

// enum AnswerStatus {correct, incorrect, }

class RiddleHandler {
  static Future<Riddle> getRiddle(
    final int level,
    final int riddle,
  ) async {
    try {
      final response = await ApiMiddleware.get('/riddles/$riddle}');
      print("response: ${response.body}");
      final data = jsonDecode(response.body);

      return Riddle.fromJson(data);
    } catch (_) {
      rethrow;
    }
  }

  // check answer
  static Future<String> checkAnswer(
    final String answer,
    final int riddle,
  ) async {
    try {
      final response = await ApiMiddleware.post(
          '/riddles/$riddle/check_answer', {'answer': answer});
      print("response: ${response.body}");
      final data = jsonDecode(response.body);

      print("response: ${data['status']}");
      return data['status'];
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
