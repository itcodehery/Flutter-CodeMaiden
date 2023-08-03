import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class SharedPreferencesHelperIcons {
  static Future<void> saveMap(Map<String, IconData> map, String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(
      map.map((key, value) => MapEntry(key, value.codePoint.toString())),
    );
    prefs.setString(key, jsonString);
  }

  static Future<Map<String, IconData>> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      return Map<String, IconData>.from(
        json.decode(jsonString).map((key, value) => MapEntry(
            key, IconData(int.parse(value), fontFamily: 'MaterialIcons'))),
      );
    } else {
      return {};
    }
  }
}
