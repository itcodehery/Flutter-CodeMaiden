//01:34:13
import 'package:flutter/material.dart';
import 'package:range_selector/range_selector_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Randomizer',
      home: RangeSelectorPage(),
    );
  }
}
