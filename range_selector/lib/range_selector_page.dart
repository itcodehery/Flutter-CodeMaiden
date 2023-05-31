import 'package:flutter/material.dart';
import 'package:range_selector/range_selector_form.dart';
import 'package:range_selector/randomizer_page.dart';

void main() => runApp(const RangeSelectorPage());

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  RangeSelectorPageState createState() => RangeSelectorPageState();
}

class RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Range Selector'),
      ),
      body: RangeSelectorForm(
        formKey: formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(max: _max, min: _min),
              ),
            );
          }
        },
        child: const Icon(Icons.chevron_right),
      ),
    );
  }
}
