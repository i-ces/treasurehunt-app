import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "http://localhost:8080";

class ApiMiddleware {
  Future<http.Response> get(String path) async {
    final url = Uri.parse('$API_URL$path');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    return response;
  }

  Future<http.Response> post(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('$API_URL$path');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
