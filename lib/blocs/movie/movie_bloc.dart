import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

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

        FormData data = FormData.fromMap({
          'title': event.title,
          'director': event.director,
          'year': event.year,
          'rating': event.rating,
          'runtime': event.runtime,
          'age': event.age,
          'genre': event.genre,
          'description': event.description,
          'url': event.url,
          'image': await MultipartFile.fromFile(event.image.path),
        });
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

        FormData data = FormData.fromMap({
          'title': event.title,
          'director': event.director,
          'year': event.year,
          'rating': event.rating,
          'runtime': event.runtime,
          'age': event.age,
          'genre': event.genre,
          'description': event.description,
          'url': event.url,
          'image': (event.image != null) ? await MultipartFile.fromFile(event.image!.path) : null,
        });
        movie = await MovieApi.updateMovie(id: event.id, data: data);

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

        movie = await MovieApi.deleteMovie(id: event.id);

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
