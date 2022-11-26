import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit()
      : super(const StepperState(
          index: 1,
        ));

  void setStep(int index) => emit(StepperState(
        index: index,
      ));
}
