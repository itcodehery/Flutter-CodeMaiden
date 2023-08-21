import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:musidict/Services/dictionary.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

Card searchReturnCard = const Card(
  color: Colors.white12,
  child: Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: 100, vertical: 20),
    child: Text(
      "Search for anything!",
      style: TextStyle(color: Colors.white),
    ),
  ),
);

Card searchCompleteCard(String titletext, String desc) {
  return const Card(
      //should return the search item
      );
}

void _onSearchInitiated(String value) {
  if (Dictionary().grade1.containsKey(value.toLowerCase())) {
    String hello = Dictionary().grade1[value]!;
    searchCompleteCard(hello, 'Welcome');
  }
}

class SearchPageState extends State<SearchPage> {
  String? searchValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a search value!';
                  } else if (value.length < 3) {
                    return 'Search item is too short!';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.amberAccent,
                          content: Text('Search? Lmao')),
                    );
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.amber.shade100.withAlpha(30),
                    hintText: ' Search for a music term',
                    hintStyle:
                        TextStyle(color: Colors.amber.shade100.withAlpha(80)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 0))),
                cursorColor: Colors.amber,
                onChanged: (value) => _onSearchInitiated(value),
              ),
            )),
        Center(child: searchReturnCard),
      ]),
    );
  }
}
