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
    on<GetMovie>((event, emit) async {
      try {
        emit(MovieLoading());

        Movie request = await MovieApi.getMovie();

        emit(MovieLoaded(
          movie: request.data,
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
        Movie request = await MovieApi.searchMovie(title: title);

        emit(MovieLoaded(
          movie: request.data,
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
        String request = await MovieApi.createMovie(data: data);

        emit(MovieCreated(
          message: request,
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
          'image': (event.image != null)
              ? await MultipartFile.fromFile(event.image!.path)
              : null,
        });
        String request = await MovieApi.updateMovie(id: event.id, data: data);

        emit(MovieUpdated(
          message: request,
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

        String request = await MovieApi.deleteMovie(id: event.id);

        emit(MovieDeleted(
          message: request,
        ));
      } catch (e) {
        emit(MovieError(
          message: e.toString(),
        ));
      }
    });
  }
}
