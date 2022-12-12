part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class SetImage extends ImageEvent {
  const SetImage({
    required this.image,
  });

  final File image;

  @override
  List<Object> get props => [image];
}