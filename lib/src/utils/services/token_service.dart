import 'package:shared_preferences/shared_preferences.dart';
import 'package:treasurehunt/src/models/auth_cred.dart';

Future<void> storeAuthCred(AuthCred cred) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', cred.token);
  await prefs.setString('client', cred.client);
  await prefs.setString('uid', cred.uid);
}

Future<AuthCred> getAuthCred() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  final client = prefs.getString('client') ?? '';
  final uid = prefs.getString('uid') ?? '';
  return AuthCred(token: token, client: client, uid: uid);
}

Future<void> storeUserLevel(int level) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('user_level', level);
}

Future<int> getUserLevel() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('user_level') ?? 0;
}
