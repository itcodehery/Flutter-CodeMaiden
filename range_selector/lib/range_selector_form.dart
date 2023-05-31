import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    super.key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  });

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: minValueSetter,
            ),

            const SizedBox(height: 12), //for the gap

            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: maxValueSetter,
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    final Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: false,
          signed: true,
        ),
        validator: (value) {
          if (value == null || int.tryParse(value) == null) {
            return 'Must be an integer!'; //error message
          } else {
            return null;
          }
        }, //if the input is not valid, it gives an error message
        enableSuggestions: false,
        onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')));
  }
}
