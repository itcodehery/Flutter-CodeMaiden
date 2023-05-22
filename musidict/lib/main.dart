import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IconData iconstate = Icons.add;
  late String titleText, subtitleText;
  
  Card createCard(String titletext, String subtitletext){
    return Card(
        elevation: 2,
        child: Column(
          children: [
            Card(
              child: Row(children: [Text(titleText), Text(subtitleText)],
              )
            ),
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Musidict'),
      ),
  
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            iconstate == Icons.add ? iconstate = Icons.check : iconstate = Icons.add;
          });
        },
        backgroundColor: Colors.orange,
        focusColor: Colors.orange,
        hoverColor: Colors.deepOrange,
        splashColor: Colors.redAccent,
        child: Icon(iconstate),
      ),
  
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, //floating button location is above the navigation bar
  
      bottomNavigationBar: BottomNavigationBar(items: const [
  
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
        ),
  
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note, color: Colors.black), 
          label: 'Library'
        ),
  
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: Colors.black), 
          label: 'Settings'),
  
      ]),
      body: Row(
        children: [
          createCard('Allegro', 'Play fast'),
          createCard('Allegretto','Play fast but not as fast as Allegro'),
          createCard('Forte','Play loudly'),
        ],
      ) 
    )
    
    );
  }
}
