import 'package:http/http.dart' as http;
import 'package:treasurehunt/src/constants.dart';
import 'dart:convert';

import 'package:treasurehunt/src/utils/services/token_service.dart';

class ApiMiddleware {
  static Future<http.Response> get(String path) async {
    final token = await getAuthCred();
    final url = Uri.parse('$API_URL$path');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'access-token': token.token,
        'client': token.client,
        'uid': token.uid,
      },
    );
    return response;
  }

  Future<http.Response> post(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('$API_URL$path');
    final token = await getAuthCred();
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'access-token': token.token,
        'client': token.client,
        'uid': token.uid,
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
