import "package:http/http.dart" as http;
import "dart:convert";

import "package:treasurehunt/src/constants.dart";
import "package:treasurehunt/src/models/auth_cred.dart";

class AuthHandler {
  static Future<AuthCred> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$API_URL/auth/sign_in/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print("response: ${response.headers}");
    if (response.statusCode == 200) {
      return AuthCred(
          client: response.headers['client']!,
          token: response.headers['access-token']!,
          uid: response.headers['uid']!);
    } else {
      throw Exception('Failed to login');
    }
  }
}
