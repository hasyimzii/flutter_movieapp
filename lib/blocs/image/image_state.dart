part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();
  
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoaded extends ImageState {
  const ImageLoaded({
    required this.image,
  });

  final File image;

  @override
  List<Object> get props => [image];
}
