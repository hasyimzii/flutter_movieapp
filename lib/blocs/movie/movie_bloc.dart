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
  }
}
