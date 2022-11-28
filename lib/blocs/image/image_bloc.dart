import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    on<SetImage>((event, emit) {
      emit(ImageLoaded(
        image: event.image,
      ));
    });
  }
}
