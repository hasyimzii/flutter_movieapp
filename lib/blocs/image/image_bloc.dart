import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<SetImage>((event, emit) {
      emit(ImageLoaded(
        image: event.image,
      ));
    });

    on<ResetImage>((event, emit) {
      emit(ImageInitial());
    });
  }
}
