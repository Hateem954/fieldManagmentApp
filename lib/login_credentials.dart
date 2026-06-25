import 'package:shared_preferences/shared_preferences.dart';

/// Save UID
Future<void> saveUserUid(String uid) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_uid', uid);
}

/// Get UID
Future<String?> getUserUid() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_uid');
}

/// Remove UID (Logout)
Future<void> removeUserUid() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_uid');
}
