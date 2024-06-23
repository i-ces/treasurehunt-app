import 'package:http/http.dart' as http;
import 'dart:convert';

const String API_URL = "http://localhost:8080";

class ApiMiddleware {
  final String endpoint;

  ApiMiddleware(this.endpoint);

  Future<http.Response> get(String path) async {
    final url = Uri.parse('$API_URL$endpoint$path');
    final response = await http.get(url);
    return response;
  }

  Future<http.Response> post(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('$API_URL$endpoint$path');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> put(String path, Map<String, dynamic> data) async {
    final url = Uri.parse('$API_URL$endpoint$path');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> delete(String path) async {
    final url = Uri.parse('$API_URL$endpoint$path');
    final response = await http.delete(url);
    return response;
  }
}
