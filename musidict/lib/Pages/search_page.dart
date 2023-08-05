import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  static const _suggestions = [
    "Allegro",
    "Allegretto",
    "Pianissimo",
    "Piano",
    "Mezzo Piano",
    "Mezzo Forte",
    "Forte"
  ];

  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EasySearchBar(
            title: const Text('Search'),
            onSearch: (context) {},
            suggestions: _suggestions,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      }),
    );
  }
}
