import 'package:flutter/material.dart';
import 'package:musidict/Services/sharedphicons.dart';
import 'package:musidict/Services/sharedprefhelper.dart';
import 'package:musidict/Services/dictionary.dart';

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
  var dictionary = Dictionary().grade1;
  Map<String, IconData> cardIcons = {};

  void initializeIcons() {
    //this method added the 'not bookmarked' icon as the default for every card
    dictionary.forEach((key, value) {
      cardIcons.putIfAbsent(key, () => Icons.bookmark_add_outlined);
    });
    dictionary.forEach((key, value) {
      cardIcons.updateAll(
        (key, value) => Icons.bookmark_add_outlined,
      );
    });
  }

  static var calledOnce = false;

  @override
  void initState() {
    super.initState();
    if (calledOnce) {
      initializeIcons();
      getIconData();
    } else {
      initializeIcons();
      getIconData();
      calledOnce = true;
    }
  }

  void getIconData() async {
    final mapFromSharPref =
        await SharedPreferencesHelperIcons.getMap(cardIconsKey);
    setState(() {
      cardIcons = mapFromSharPref;
    });
  }

  void getLibraryCards() async {
    final mapFromSharedPreferences =
        await SharedPreferencesHelper.getMap(savedEntriesKey);
    setState(() {
      savedEntries = mapFromSharedPreferences;
    });
  }

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
                      } else if (cardIcons[titletext] ==
                          Icons.bookmark_outlined) {
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
                      // backgroundColor:
                      //     MaterialStatePropertyAll(Colors.amber.withAlpha(100)),
                    ),
                    child: Icon(cardIcons[titletext])),
              ),
            ],
          )),
      const SizedBox(height: 2),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.of(context).pushReplacementNamed("Search");
        //   },
        //   backgroundColor: Colors.amber,
        //   child: const Icon(
        //     Icons.search,
        //     color: Colors.black87,
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation
        //     .endFloat, floating button location is above the navigation bar

        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          Row(children: [
            const SizedBox(width: 10),
            Text('Grade 1 - 8 : ',
                style: TextStyle(color: Colors.amber.shade100)),
          ]),
          const SizedBox(height: 10),
          for (var value in dictionary.entries)
            createCard(value.key, value.value),
          const SizedBox(height: 70),
        ],
      ),
    ));
  }
}
