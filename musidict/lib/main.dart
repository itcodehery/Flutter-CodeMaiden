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
  String titleText = '', subtitleText = '';
  
  Card createCard(String titletext, String subtitletext){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              title: Text(titletext),
              subtitle: Text(subtitletext),
            )
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Musidict: The Music Dictionary'),
      ),

      // For the future baby
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //   setState(() {
      //     iconstate == Icons.add ? iconstate = Icons.check : iconstate = Icons.add;
      //    });
      //   },
      //   backgroundColor: Colors.orange,
      //   focusColor: Colors.orange,
      //   hoverColor: Colors.deepOrange,
      //   splashColor: Colors.redAccent,
      //   child: Icon(iconstate),
      // ),
  
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
      ]),
      body: ListView(
        children: <Widget>[
            createCard("Pianissimo", "pp: very soft"),
            createCard("Piano", "p: soft"),
            createCard("Mezzo Piano", "mp: medium soft (mezzo means half)"),
            createCard("Mezzo Forte", "mf: medium loud"),
            createCard("Forte", "f: loud"),
            createCard("Fortissimo", "ff: very loud"),
            createCard("Cresendo","cresc.: getting gradually louder"),
            createCard("Diminuendo","dim.: getting gradually softer"),
            createCard("Allegro", "Play a little faster"),
            createCard("Andante", "At a walking pace"),
            createCard("Moderato", "At a moderate pace"),
            createCard("Accent","Play with an accent"),
            createCard("Legato","Play smoothly"),
            createCard("Staccato","Play the marked notes detached, short and crisp"),
            createCard("Slur","Play the marked notes smoothly"),
            const Text("----------------------------", textAlign: TextAlign.center),
            createCard("Tenuto","ten.: slightly lengthen and sustain the note"),
            createCard("Cantabile", "with a singing tone"),
            createCard("Espressivo", "expressively"),
            createCard("Gracioso","gracefully"),
            createCard("Molto","very (molto expressivo means 'very expressively')"),
        ],
      )
    )
    
    );
  }
}
