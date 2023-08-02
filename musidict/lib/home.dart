import 'package:flutter/material.dart';
import 'package:musidict/main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  String titleText = '', subtitleText = '';
  var savedEntries = <String, String>{};

  Widget createCard(String titletext, String subtitletext) {
    return Column(children: [
      const SizedBox(height: 2),
      Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                title: Text(titletext),
                subtitle: Text(subtitletext),
                textColor: Colors.white,
                subtitleTextStyle: const TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.grey),
                trailing: ElevatedButton(
                    onPressed: () {
                      var saved = {titleText: subtitleText};
                      savedEntries.addEntries(saved.entries);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey[850]),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.fromLTRB(2, 0, 2, 0),
                        )),
                    child: const Icon(Icons.bookmark_add_outlined)),
              ),
            ],
          )),
      const SizedBox(height: 2),
    ]);
  }

  var dictionary = <String, String>{
    "Allegro": "Play at a fast pace",
    "Allegretto": "Play fast but not as fast as Allegro",
    "Pianissimo": "very soft",
    "Piano": "soft",
    "Mezzo Piano": "medium soft",
    "Mezzo Forte": "medium loud",
    "Forte": "to be played loudly"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation
            .endFloat, //floating button location is above the navigation bar

        body: ListView(
          children: <Widget>[
            for (var value in dictionary.entries)
              createCard(value.key, value.value)
          ],
        ));
  }
}
