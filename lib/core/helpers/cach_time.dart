import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveChatTimestamp(String playerId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(
      'lastChat_$playerId', DateTime.now().millisecondsSinceEpoch);
}

Future<DateTime?> getLastChatTimestamp(String playerId) async {
  final prefs = await SharedPreferences.getInstance();
  final millis = prefs.getInt('lastChat_$playerId');
  if (millis == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(millis);
}
