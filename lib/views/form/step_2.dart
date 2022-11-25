import 'package:flutter/material.dart';

import '../../widgets/multiline_input.dart';
import '../../widgets/text_input.dart';

class Step2 extends StatelessWidget {
  const Step2({
    Key? key,
    required this.formKey,
    required this.genreController,
    required this.urlController,
    required this.descriptionController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController genreController;
  final TextEditingController urlController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            TextInput(
              label: 'Genre',
              keyboard: TextInputType.text,
              controller: genreController,
            ),
            const SizedBox(height: 15),
            TextInput(
              label: 'Url',
              keyboard: TextInputType.url,
              controller: urlController,
            ),
            const SizedBox(height: 15),
            MultilineInput(
              label: 'Description',
              controller: descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}
