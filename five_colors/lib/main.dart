import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

void main() {
  runApp(const FiveColors());
}

class FiveColors extends StatefulWidget {
  const FiveColors({Key? key}) : super(key: key);

  @override
  FiveColorsState createState() => FiveColorsState();
}

class FiveColorsState extends State<FiveColors> {
  final Map<String, Color> colors = {
    'Purple': Colors.purple,
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Pink': Colors.pink,
    'Teal': Colors.teal,
    'Orange': Colors.orange,
  };

  Color? selectedColor;

  @override
  void initState() {
    _getStoredColor();
    super.initState();
  }

  void _getStoredColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? colorName = prefs.getString('color');
    setState(() {
      selectedColor = colors[colorName];
    });
  }

  void _setColor(String colorName, Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('color', colorName);
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Picker'),
          backgroundColor: selectedColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('You are currently on ${Platform.operatingSystem}'),
            ),
            const SizedBox(
              height: 10,
            ),
            for (var entry in colors.entries)
              Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: entry.value,
                      minimumSize: const Size(300, 60),
                    ),
                    onPressed: () => _setColor(entry.key, entry.value),
                    child: Text(entry.key),
                  )),
          ],
        ),
      ),
    );
  }
}
