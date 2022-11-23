import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/movie.dart';
import '../../services/movie_api.dart';

part 'movie_event.dart';
part 'movie_state.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    Movie movie;

    on<GetMovie>((event, emit) async {
      try {
        emit(MovieLoading());
        movie = await MovieApi.getMovie();

        emit(MovieLoaded(
          movie: movie.data,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });

    on<SearchMovie>((event, emit) async {
      try {
        emit(MovieLoading());

        String title = event.title;
        movie = await MovieApi.searchMovie(title: title);

        emit(MovieLoaded(
          movie: movie.data,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });

    on<CreateMovie>((event, emit) async {
      try {
        emit(MovieLoading());

        Map<String, dynamic> data = {
          'title': event.title,
          'director': event.director,
          'year': event.year,
          'rating': event.rating,
          'runtime': event.runtime,
          'age': event.age,
          'genre': event.genre,
          'description': event.description,
          'url': event.url,
          'image': event.image,
        };
        movie = await MovieApi.createMovie(data: data);

        emit(MovieCreated(
          message: movie.message,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });

    on<UpdateMovie>((event, emit) async {
      try {
        emit(MovieLoading());

        Map<String, dynamic> data = {
          'id': event.id,
          'title': event.title,
          'director': event.director,
          'year': event.year,
          'rating': event.rating,
          'runtime': event.runtime,
          'age': event.age,
          'genre': event.genre,
          'description': event.description,
          'url': event.url,
          'image': event.image,
        };
        movie = await MovieApi.updateMovie(data: data);

        emit(MovieUpdated(
          message: movie.message,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });

    on<DeleteMovie>((event, emit) async {
      try {
        emit(MovieLoading());

        Map<String, dynamic> data = {
          'id': event.id,
        };
        movie = await MovieApi.deleteMovie(data: data);

        emit(MovieDeleted(
          message: movie.message,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });
  }
}
