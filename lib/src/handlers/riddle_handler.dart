import "package:flutter/foundation.dart";
import "dart:convert";

import "package:treasurehunt/src/utils/middleware/api.dart";

class RiddleHandler {
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
