import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.label,
    required this.keyboard,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextInputType keyboard;
  final TextEditingController controller;
  // final FormFieldValidator<String>? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (String? value) {
        if (value?.isEmpty ?? true) return 'required';
      },
    );
  }
}
