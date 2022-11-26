import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/dropdown/dropdown_cubit.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    Key? key,
    required this.items,
    required this.controller,
  }) : super(key: key);

  final List<String> items;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, DropdownState>(
      builder: (context, state) {
        return DropdownButton(
            borderRadius: BorderRadius.circular(10),
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
