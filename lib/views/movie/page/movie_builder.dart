import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import '../../../blocs/movie/movie_bloc.dart';

import 'movie_content.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({
    Key? key,
    required this.movieLoaded,
  }) : super(key: key);

  final MovieLoaded movieLoaded;

  @override
  Widget build(BuildContext context) {
    final List<MovieData> _movie = movieLoaded.movie;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _movie.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieContent(
          image: _movie[index].image,
          title: _movie[index].title,
          director: _movie[index].director,
          rating: _movie[index].rating.toString(),
          onTapArgs: <String, dynamic>{
            'index': index,
            'movie': _movie[index],
          },
        );
      },
    );
  }
}
