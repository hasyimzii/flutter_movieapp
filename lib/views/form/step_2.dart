import 'package:flutter/material.dart';

import '../../widgets/dropown_widget.dart';
import '../../widgets/multiline_input.dart';
import '../../widgets/text_input.dart';

class Step2 extends StatelessWidget {
  const Step2({
    Key? key,
    required this.formKey,
    required this.ageController,
    required this.urlController,
    required this.descriptionController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController ageController;
  final TextEditingController urlController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          DropdownWidget(
            label: 'Age',
            items: const ['All', '7+', '13+', '16+', '18+'],
            controller: ageController,
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
    );
  }
}
