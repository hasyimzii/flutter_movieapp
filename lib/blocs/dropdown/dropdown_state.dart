part of 'dropdown_cubit.dart';

class DropdownState extends Equatable {
  const DropdownState({
    required this.value,
  });

  final String value;

  @override
  List<Object> get props => [value];
}
