import 'package:flutter/material.dart';
//const is a constant
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  final List<String> textItems = [
    'Mots',
    'SushK',
    'Vignesh',
    'Sneha',
    'Anjo',
    'Joshwin',
    'Ranak'
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          primary: false,
          backgroundColor: Colors.black,
          title: const Text('Dynamic Lists'),
        ),
        body: ListView.builder(
          itemCount: textItems.length,
          itemBuilder: (BuildContext context, int index ) {
            return ListTile(
              title: Text(textItems[index]),
            );
          }
          )
          )
        );
  }
}
