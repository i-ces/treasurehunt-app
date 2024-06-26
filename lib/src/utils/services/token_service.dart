import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeBearerToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('bearer_token', token);
}

Future<String?> getBearerToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('bearer_token');
}
