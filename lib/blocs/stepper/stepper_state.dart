part of 'stepper_cubit.dart';

class StepperState extends Equatable {
  const StepperState({
    required this.index,
  });

  final int index;

  @override
  List<Object> get props => [index];
}