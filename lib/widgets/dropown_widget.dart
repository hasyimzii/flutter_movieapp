import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapp/utils/style.dart';

import '../blocs/dropdown/dropdown_cubit.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.isUpdate,
    required this.label,
    required this.items,
    required this.controller,
  }) : super(key: key);

  final bool isUpdate;
  final String label;
  final List<String> items;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, DropdownState>(
      builder: (context, state) {
        return DropdownButtonFormField(
            isDense: true,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(20, 1, 20, 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: label,
              labelStyle: subtitleText(13),
            ),
            value: state.value,
            icon: const Icon(Icons.arrow_drop_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? value) {
              final DropdownCubit dropdownCubit = context.read<DropdownCubit>();
              dropdownCubit.setValue(value!);
              controller.text = value;
            });
      },
    );
  }
}
