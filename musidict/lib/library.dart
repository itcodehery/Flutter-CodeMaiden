import 'package:flutter/material.dart';
import 'package:musidict/sharedprefhelper.dart';
import 'package:musidict/sharedphicons.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  static const String savedEntriesKey = 'saved_entries';
  static const String cardIconsKey = 'card_icons';

  Map<String, String> savedIterables = {};
  Map<String, IconData> savedIcons = {};
  int saved = 0;

  void getLibraryCards() async {
    final mapFromSharedPreferences =
        await SharedPreferencesHelper.getMap(savedEntriesKey);
    setState(() {
      savedIterables = mapFromSharedPreferences;
      savedIterables.forEach((key, value) => saved++);
    });
  }

  void getIconData() async {
    final mapFromSharPref =
        await SharedPreferencesHelperIcons.getMap(cardIconsKey);
    setState(() {
      savedIcons = mapFromSharPref;
      savedIcons.forEach((key, value) {
        saved++;
      });
    });
  }

  Widget createCard(String titletext, String subtitletext) {
    IconData cardIconDef = Icons.remove_circle_outline;

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
                      setState(() {
                        savedIterables.remove(titletext);
                        SharedPreferencesHelper.saveMap(
                            savedIterables, savedEntriesKey);
                        debugPrint('$savedIterables saved!');
                        saved--;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                    ),
                    child: Icon(cardIconDef),
                  )),
            ],
          )),
      const SizedBox(height: 2),
    ]);
  }

  @override
  void initState() {
    super.initState();
    // Call the function to retrieve the map from shared preferences
    getLibraryCards();
  }

  Widget nullPage() {
    return const Scaffold(
      body: Center(
        child: Text(
          'Save some hard words here!',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            savedIterables = {};
            SharedPreferencesHelper.saveMap(savedIterables, savedEntriesKey);
          });
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.clear_all, color: Colors.black87),
      ),
      body: (savedIterables.isEmpty)
          ? nullPage()
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(children: [
                      const SizedBox(width: 10),
                      Text('$saved saved Cards:',
                          style: TextStyle(color: Colors.amber.shade100)),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  for (var entry in savedIterables.entries)
                    createCard(entry.key, entry.value),
                  const SizedBox(height: 70),
                ],
              )),
    );
  }
}
