import 'package:shared_preferences/shared_preferences.dart';

Future<bool> addValToLocalStorage(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.setString(key, value);
}

Future<String> getValFromLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key);
}


Future<bool> removeValFromLocalStorage(String key) async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.remove(key);
}