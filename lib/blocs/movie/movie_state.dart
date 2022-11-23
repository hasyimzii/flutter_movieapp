part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  const MovieLoaded({
    required this.movie,
  });

  final List<MovieData> movie;

  @override
  List<Object> get props => [movie];
}

class MovieCreated extends MovieState {
  const MovieCreated({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class MovieUpdated extends MovieState {
  const MovieUpdated({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class MovieDeleted extends MovieState {
  const MovieDeleted({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}

class MovieError extends MovieState {
  const MovieError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}