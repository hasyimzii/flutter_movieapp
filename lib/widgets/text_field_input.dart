import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final String label;
  final TextEditingController text;
  final FormFieldValidator<String>? validator;

  const TextFieldInput({
    Key? key,
    required this.label,
    required this.text,
    required this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: validator,
    );
  }
}
