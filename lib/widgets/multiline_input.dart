import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
        ),
        validator: (String? value) {
          if (value?.isEmpty ?? true) return 'required';
        },
      ),
    );
  }
}
