import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

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

        Future<MultipartFile> image = MultipartFile.fromFile(
          event.image.path,
          filename: event.image.path.split('/').last,
        );

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
          'image': image,
        };
        movie = await MovieApi.createMovie(data: FormData.fromMap(data));

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

        Future<MultipartFile>? image;
        if (event.image != null) {
          image = MultipartFile.fromFile(
            event.image!.path,
            filename: event.image!.path.split('/').last,
          );
        } else {
          image = null;
        }

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
          'image': image,
          'old_image': event.oldImage,
        };
        movie = await MovieApi.updateMovie(data: FormData.fromMap(data));

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
