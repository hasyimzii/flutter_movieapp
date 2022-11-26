import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_state.dart';

class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit()
      : super(const DropdownState(
          value: 'All',
        ));

  void setValue(String value) => emit(DropdownState(
        value: value,
      ));
}
