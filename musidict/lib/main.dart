import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IconData iconstate = Icons.add;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: const Text('Musidict'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(iconstate),
        onPressed: () {
          iconstate == Icons.add ? iconstate = Icons.check : iconstate = Icons.add;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Your Music'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded), label: 'Account')
        ]
      ),
      drawer: const Drawer(
        child: Text('Yo!!'), 
        ),
      )
    );
  }
}