import 'package:flutter/material.dart';
import 'package:musidict/Services/sharedphicons.dart';
import 'package:musidict/Services/sharedprefhelper.dart';

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
    //from the icon map the cards should respond
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
                      fontStyle: FontStyle.italic, color: Colors.black45),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        savedIterables.remove(titletext);
                        savedIcons[titletext] = Icons.bookmark_add_outlined;
                        SharedPreferencesHelperIcons.saveMap(
                            savedIcons, cardIconsKey);
                        SharedPreferencesHelper.saveMap(
                            savedIterables, savedEntriesKey);
                        debugPrint('$savedIterables saved!');
                        saved--;
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      elevation: const MaterialStatePropertyAll(0.0),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey[900]),
                    ),
                    child: Icon(cardIconDef, color: Colors.white),
                  )),
            ],
          )),
      const SizedBox(height: 2),
    ]);
  }

  void destroyIconMap() async {
    savedIcons.forEach((key, value) {
      savedIcons[key] = Icons.bookmark_add_outlined;
    });
    SharedPreferencesHelperIcons.saveMap(savedIcons, cardIconsKey);
  }

  @override
  void initState() {
    super.initState();
    getLibraryCards();
    getIconData();
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
        onPressed: () {
          setState(() {
            // savedIcons.forEach((key, value) {
            //   value == Icons.bookmark_add_outlined;
            // });
            destroyIconMap();
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: Row(children: [
                      const SizedBox(width: 10),
                      Text('$saved saved terms:',
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
