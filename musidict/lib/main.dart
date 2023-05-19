import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: const Text('Musidict'),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: Colors.teal,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 170, 33, 33), width: 1.0) 
          ),
          child: const Text('Hi Mom! 🤩') 
        ),
      )
    );
  }
}