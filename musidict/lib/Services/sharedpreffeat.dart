import 'dart:math';
import 'package:musidict/Services/dictionary.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> generateAndStoreRandomValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Get the last generated date from SharedPreferences
  String lastGeneratedDate = prefs.getString('lastGeneratedDate') ?? '';

  // Get the current date
  String currentDate = DateTime.now().toLocal().toString().split(' ')[0];

  // If it's a new day, generate a new random value
  if (lastGeneratedDate != currentDate) {
    Random random = Random();
    int randomValue = random
        .nextInt(Dictionary().grade1.length - 1); // Change this range as needed
    prefs.setInt('randomValue', randomValue);
    prefs.setString('lastGeneratedDate', currentDate);
  }
}

Future<int> getRandomValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int randomValue = prefs.getInt('randomValue') ?? 0;

  return randomValue;
}
