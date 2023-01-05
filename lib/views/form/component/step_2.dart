import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/dropdown/dropdown_cubit.dart';

import '../../../widgets/dropown_widget.dart';
import '../../../widgets/multiline_input.dart';
import '../../../widgets/text_input.dart';

class Step2 extends StatelessWidget {
  const Step2({
    Key? key,
    required this.isUpdate,
    required this.formKey,
    required this.ageController,
    required this.urlController,
    required this.descriptionController,
  }) : super(key: key);

  final bool isUpdate;
  final GlobalKey<FormState> formKey;
  final TextEditingController ageController;
  final TextEditingController urlController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    if (isUpdate) {
      final DropdownCubit dropdownCubit = context.read<DropdownCubit>();
      dropdownCubit.setValue(ageController.text);
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          DropdownWidget(
            isUpdate: isUpdate,
            label: 'Age',
            items: const ['All', '7+', '13+', '16+', '18+'],
            controller: ageController,
          ),
          const SizedBox(height: 20),
          TextInput(
            label: 'Url',
            keyboard: TextInputType.url,
            controller: urlController,
          ),
          const SizedBox(height: 20),
          MultilineInput(
            label: 'Description',
            controller: descriptionController,
          ),
        ],
      ),
    );
  }
}
