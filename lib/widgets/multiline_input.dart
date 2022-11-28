import 'package:flutter/material.dart';
import 'package:flutter_movieapp/utils/style.dart';

class MultilineInput extends StatelessWidget {
  const MultilineInput({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  // final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 1, 20, 100),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
        labelStyle: subtitleText(13),
      ),
      validator: (String? value) {
        if (value?.isEmpty ?? true) return 'required';
        return null;
      },
    );
  }
}
