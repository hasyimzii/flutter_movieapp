import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String label;
  final TextEditingController text;
  final FormFieldValidator onChanged;

  const TextFieldInput({
    Key? key,
    required this.label,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: onChanged,
    );
  }
}
