import 'package:shared_preferences/shared_preferences.dart';

class Memory {
  static const String kElapsedTimeKey = "elapsed-time";

  static late final SharedPreferences _prefs;

  static Future<void> initStorage() async =>
      _prefs = await SharedPreferences.getInstance();

  static void saveElapsedTime(Duration elapsedTime) {
    final int value = elapsedTime.inMilliseconds;
    _prefs.setInt(kElapsedTimeKey, value);
  }

  static Duration restoreElapsedTime() {
    final int milliseconds = _prefs.getInt(kElapsedTimeKey) ?? 0;
    return Duration(milliseconds: milliseconds);
  }
}
