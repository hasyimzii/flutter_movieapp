import 'package:flutter/material.dart';
import 'package:flutter_movieapp/utils/style.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20, 1, 1, 11),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          labelStyle: subtitleText(13),
        ),
        validator: (String? value) {
          if (value?.isEmpty ?? true) return 'required';
        },
      ),
    );
  }
}
