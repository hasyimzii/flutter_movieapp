import 'package:flutter/material.dart';

import '../../widgets/text_input.dart';
import '../../widgets/dropown_widget.dart';

class Step1 extends StatelessWidget {
  const Step1({
    Key? key,
    required this.formKey,
    required this.titleController,
    required this.directorController,
    required this.yearController,
    required this.runtimeController,
    required this.ratingController,
    required this.ageController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController directorController;
  final TextEditingController yearController;
  final TextEditingController runtimeController;
  final TextEditingController ratingController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextInput(
                label: 'Title',
                keyboard: TextInputType.text,
                controller: titleController,
              ),
              const SizedBox(height: 15),
              TextInput(
                label: 'Director',
                keyboard: TextInputType.text,
                controller: directorController,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  TextInput(
                    label: 'Year',
                    keyboard: TextInputType.number,
                    controller: yearController,
                  ),
                  TextInput(
                    label: 'Runtime',
                    keyboard: TextInputType.text,
                    controller: runtimeController,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  TextInput(
                    label: 'Rating',
                    keyboard: TextInputType.number,
                    controller: ratingController,
                  ),
                  // DropdownWidget(
                  //   items: const ['All', '7+', '13+', '16+', '18+'],
                  //   controller: ageController,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
