import 'package:flutter/material.dart';
import 'package:musidict/home.dart';
import 'package:musidict/main.dart';

class Library extends StatelessWidget {
  Library({Key? key}) : super(key: key);

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

  final Map savedIterables = const Home().createState().savedEntries;

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
