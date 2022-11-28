part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovie extends MovieEvent {}

class SearchMovie extends MovieEvent {
  const SearchMovie({
    required this.title,
  });

  final String title;

  @override
  List<Object> get props => [title];
}

class CreateMovie extends MovieEvent {
  const CreateMovie({
    required this.title,
    required this.director,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.age,
    required this.genre,
    required this.description,
    required this.url,
    required this.image,
  });

  final String title;
  final String director;
  final String year;
  final double rating;
  final String runtime;
  final String age;
  final String genre;
  final String description;
  final String url;
  final XFile image;
}

class UpdateMovie extends MovieEvent {
  const UpdateMovie({
    required this.id,
    required this.title,
    required this.director,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.age,
    required this.genre,
    required this.description,
    required this.url,
    required this.image,
    required this.oldImage,
  });

  final int id;
  final String title;
  final String director;
  final String year;
  final double rating;
  final String runtime;
  final String age;
  final String genre;
  final String description;
  final String url;
  final XFile? image;
  final String oldImage;
}

class DeleteMovie extends MovieEvent {
  const DeleteMovie({
    required this.id,
  });

  final int id;
}
