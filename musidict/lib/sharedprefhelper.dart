import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For JSON encoding/decoding

class SharedPreferencesHelper {
  static const String _mapKey = 'map_key';

  static Future<void> saveMap(Map<String, String> map) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(map);
    prefs.setString(_mapKey, jsonString);
  }

  static Future<Map<String, String>> getMap() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_mapKey);
    if (jsonString != null) {
      return Map<String, String>.from(json.decode(jsonString));
    } else {
      return {};
    }
  }
}
