import 'package:flutter/material.dart';

import '../../../../models/movie.dart';
import '../../../../blocs/movie/movie_bloc.dart';

import 'movie_content.dart';

class MovieBuilder extends StatelessWidget {
  const MovieBuilder({
    Key? key,
    required this.movieLoaded,
  }) : super(key: key);

  final MovieLoaded movieLoaded;

  @override
  Widget build(BuildContext context) {
    final List<MovieData> movie = movieLoaded.movie;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      itemCount: movie.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieContent(
          image: movie[index].image,
          title: movie[index].title,
          director: movie[index].director,
          year: movie[index].year,
          rating: movie[index].rating,
          onTapArgs: <String, dynamic>{
            'movie': movie[index],
          },
        );
      },
    );
  }
}
