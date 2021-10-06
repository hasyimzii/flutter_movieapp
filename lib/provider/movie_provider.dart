import 'package:flutter/foundation.dart';
import '../models/movie.dart';

class MovieProvider with ChangeNotifier {
  // movie class models
  final List<Movie> _movies = [
    Movie(
      'assets/images/poster.jpg',
      'The Godfather',
      'Francis Ford Coppola',
    ),
    Movie(
      'assets/images/poster1.jpg',
      'Star Wars IV',
      'George Lucas',
    ),
    Movie(
      'assets/images/poster2.jpg',
      'Django Unchained',
      'Quentin Tarantino',
    ),
    Movie(
      'assets/images/poster3.jpg',
      '12 Angry Men',
      'Sidney Lumet',
    ),
    Movie(
      'assets/images/poster4.jpg',
      'Scarface',
      'Brian De Palma',
    ),
    Movie(
      'assets/images/poster5.jpg',
      'Taxi Driver',
      'Martin Scorsese',
    ),
  ];

  List get movies => _movies;
  int get moviesLength => _movies.length;

  void editMovie(int index, Movie movie) {
    _movies[index] = movie;
    notifyListeners();
  }

  void deleteMovie(Movie movie){
    _movies.remove(movie);
    notifyListeners();
  }
}