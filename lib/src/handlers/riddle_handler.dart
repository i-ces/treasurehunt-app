import 'dart:convert';

import 'package:treasurehunt/src/models/riddle.dart';
import 'package:treasurehunt/src/utils/middleware/api.dart';

class RiddleHandler {
  Future<Riddle> getRiddle(final int level, final int riddle) async {
    try {
      final response =
          await ApiMiddleware().get('/level/$level/riddles/$riddle');
      final data = jsonDecode(response.body);
      return Riddle.fromJson(data);
    } catch (_) {
      rethrow;
    }
  }
}
