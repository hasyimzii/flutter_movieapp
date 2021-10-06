import 'package:flutter/foundation.dart';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  // movie class models
  final List<Movie> _movies = [];

  List get movies => _movies;
  int get moviesLength => _movies.length;

  void createMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void editMovie(int index, Movie movie) {
    _movies[index] = movie;
    notifyListeners();
  }

  void deleteMovie(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }
}
