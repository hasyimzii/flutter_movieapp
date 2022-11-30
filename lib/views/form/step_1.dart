import 'package:flutter/material.dart';

import '../../widgets/text_input.dart';

class Step1 extends StatelessWidget {
  const Step1({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.directorController,
    required this.yearController,
    required this.genreController,
    required this.runtimeController,
    required this.ratingController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController directorController;
  final TextEditingController yearController;
  final TextEditingController genreController;
  final TextEditingController runtimeController;
  final TextEditingController ratingController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextInput(
            label: 'Title',
            keyboard: TextInputType.text,
            controller: titleController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Director',
            keyboard: TextInputType.text,
            controller: directorController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Year',
            keyboard: TextInputType.number,
            controller: yearController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Genre',
            keyboard: TextInputType.text,
            controller: genreController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Runtime',
            keyboard: TextInputType.text,
            controller: runtimeController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Rating',
            keyboard: TextInputType.number,
            controller: ratingController,
          ),
        ],
      ),
    );
  }
}
