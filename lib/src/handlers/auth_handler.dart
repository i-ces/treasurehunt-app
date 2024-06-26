import "package:http/http.dart" as http;
import "dart:convert";

class AuthHandler {
  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('helloworldapi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
