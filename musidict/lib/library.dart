import 'package:flutter/material.dart';
import 'package:musidict/sharedprefhelper.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
              ),
            ],
          )),
      const SizedBox(height: 2),
    ]);
  }

  Map savedIterables = {};
  int saved = 0;

  void getLibraryCards() async {
    // Retrieve the map from shared preferences and update the state
    final mapFromSharedPreferences = await SharedPreferencesHelper.getMap();
    setState(() {
      savedIterables = mapFromSharedPreferences;
      savedIterables.forEach((key, value) => saved++);
    });
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
          'No values saved',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (savedIterables.isEmpty)
        ? nullPage()
        : Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    for (var entry in savedIterables.entries)
                      createCard(entry.key, entry.value)
                  ],
                )),
          );
  }
}
