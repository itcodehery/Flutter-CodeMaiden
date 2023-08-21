import 'package:flutter/material.dart';
import 'package:musidict/Services/dictionary.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

void _onSearchInitiated(String value) {}

class SearchPageState extends State<SearchPage> {
  String? searchValue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            'Search for a musical term:',
            style: TextStyle(color: Colors.amber.shade100),
          ),
        ),
        Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please enter a search value!';
                  } else if (value!.length < 3) {
                    return 'Search item is too short!';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black38,
                    hintText: 'Search for a music term',
                    hintStyle:
                        TextStyle(color: Colors.amber.shade200.withAlpha(40)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(width: 0))),
                cursorColor: Colors.amber,
                onChanged: (value) => _onSearchInitiated(value),
              ),
            )),
      ]),
    );
  }
}
