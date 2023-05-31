import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;
  const RandomizerPage({
    Key? key,
    required this.max,
    required this.min,
  }) : super(key: key);
  @override
  RandomizerPageState createState() => RandomizerPageState();
}

class RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Randomizer')),
      body: Text(
        _generatedNumber?.toString() ?? 'Click to generate a number.',
        style: const TextStyle(fontSize: 32),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Generate'),
        onPressed: () {
          setState(() {
            //say min is 10 and max is 20
            _generatedNumber = widget.min +
                randomGenerator.nextInt(widget.max + 1 - widget.min);
          });
        },
      ),
    );
  }
}
