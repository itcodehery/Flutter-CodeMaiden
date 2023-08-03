import 'package:flutter/material.dart';
import 'package:musidict/sharedphicons.dart';
import 'package:musidict/sharedprefhelper.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  static const String cardIconsKey = 'card_icons';
  static const String savedEntriesKey = 'saved_entries';

  String titleText = '', subtitleText = '';
  var savedEntries = <String, String>{};
  var cardIcons = <String, IconData>{};

  Widget createCard(String titletext, String subtitletext) {
    IconData initialIcon = savedEntries.containsKey(titletext)
        ? Icons.bookmark_outlined
        : Icons.bookmark_add_outlined;
    cardIcons[titletext] = initialIcon;

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
                    fontStyle: FontStyle.italic, color: Colors.blue),
                trailing: ElevatedButton(
                    onPressed: () async {
                      if (cardIcons[titletext] == Icons.bookmark_add_outlined) {
                        setState(() {
                          savedEntries[titletext] = subtitletext;
                          debugPrint('Saved Entries: $savedEntries');
                          SharedPreferencesHelper.saveMap(
                              savedEntries, savedEntriesKey);
                          cardIcons[titletext] = Icons.bookmark_outlined;
                          SharedPreferencesHelperIcons.saveMap(
                              cardIcons, cardIconsKey);
                        });
                      } else {
                        setState(() {
                          savedEntries.remove(titletext);
                          SharedPreferencesHelper.saveMap(
                              savedEntries, savedEntriesKey);
                          debugPrint('Saved Entries: $savedEntries');
                          cardIcons[titletext] = Icons.bookmark_add_outlined;
                          SharedPreferencesHelperIcons.saveMap(
                              cardIcons, cardIconsKey);
                        });
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.amber.withAlpha(50)),
                    ),
                    child: Icon(cardIcons[titletext])),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("Search");
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.search,
            color: Colors.black87,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation
            .endFloat, //floating button location is above the navigation bar

        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              for (var value in dictionary.entries)
                createCard(value.key, value.value)
            ],
          ),
        ));
  }
}
