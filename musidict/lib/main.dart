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

  Map<String, String> dictionary = {
    "Allegro": "Play at a fast pace",
    "Allegretto": "Play fast but not as fast as Allegro",
    "Pianissimo": "very soft",
    "Piano": "soft",
    "Mezzo Piano": "medium soft",
    "Mezzo Forte": "medium loud",
    "Forte": "to be played loudly"
  };

  Card createCard(String titletext, String subtitletext) {
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
              trailing: const Icon(Icons.bookmark_add_outlined),
            )
          ],
        ));
  }

  Card createCardfromMap(Map<String, String> mapAbsolute) {
    return const Card();
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

            floatingActionButtonLocation: FloatingActionButtonLocation
                .endFloat, //floating button location is above the navigation bar

            bottomNavigationBar: BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.black),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note, color: Colors.black),
                  label: 'Library'),
            ]),
            body: ListView(
              children: <Widget>[
                const Text(
                  "Grade 1",
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                ),
                createCard("Pianissimo", "pp: very soft"),
                createCard("Piano", "p: soft"),
                createCard("Mezzo Piano", "mp: medium soft (mezzo means half)"),
                createCard("Mezzo Forte", "mf: medium loud"),
                createCard("Forte", "f: loud"),
                createCard("Fortissimo", "ff: very loud"),
                createCard("Cresendo", "cresc.: getting gradually louder"),
                createCard("Diminuendo", "dim.: getting gradually softer"),
                createCard("Allegro", "Play a little faster"),
                createCard("Andante", "At a walking pace"),
                createCard("Moderato", "At a moderate pace"),
                createCard("Accent", "Play with an accent"),
                createCard("Legato", "Play smoothly"),
                createCard("Staccato",
                    "Play the marked notes detached, short and crisp"),
                createCard("Slur", "Play the marked notes smoothly"),
                const Divider(
                  height: 12,
                  thickness: 2,
                ),
                const Text(
                  "Grade 2",
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                ),
                createCard(
                    "Tenuto", "ten.: slightly lengthen and sustain the note"),
                createCard("Cantabile", "with a singing tone"),
                createCard("Espressivo", "expressively"),
                createCard("Gracioso", "gracefully"),
                createCard("Molto", "very"),
                createCard("8va", "Play music an octave higher"),
                createCard("8vb", "Play music an octave lower"),
                createCard("Adagio", "slow"),
                createCard("Allegretto", "quite fast but slower than Allegro"),
                createCard("Vivace", "fast and lively"),
                const Divider(
                  height: 12,
                  thickness: 2,
                ),
                const Text(
                  "Grade 3",
                  textScaleFactor: 1,
                  textAlign: TextAlign.left,
                ),
                createCard("Marcato", "marked/accented"),
                createCard(
                    "Semi-Staccato", "halfway between legato and staccato"),
                createCard("Dolce", "sweetly"),
                createCard("Leggiero", "Lightly"),
                createCard("Marziale", "march-like"),
                createCard("Tranquillo", "calmly"),
                createCard("Vivo", "Lively"),
                createCard("Al, Alla", "like"),
                createCard("A tempo",
                    "in time or at the spped that the piece started"),
                createCard("Con", "with"),
                createCard("da capo al Fine",
                    "go back to the beginning and play until it says Fine"),
                createCard("Mosso, Moto", "movement"),
                // ListView.builder(
                //   itemCount: dictionary.length,
                //   itemBuilder: (context, index) {
                //   Iterable<MapEntry<String, String>> dict = dictionary.entries.;
                //   return createCard();
                //   },
                // )

                // dictionary.forEach((key, value) {
                //   String a = key;
                //   String b = value;
                //   createCard(a, b);
                // })
              ],
            )));
  }
}
