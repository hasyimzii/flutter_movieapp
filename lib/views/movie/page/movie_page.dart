import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/style.dart';

import '../../../blocs/movie/movie_bloc.dart';

import '../../../widgets/app_layout.dart';
import '../../../widgets/search_bar.dart';

import 'movie_builder.dart';
import 'movie_skeleton.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return AppLayout(
      title: 'Movie List',
      body: Column(
        children: [
          SearchBar(
            controller: _controller,
            placeholder: 'Search Movie',
            onSubmitted: (value) {
              final MovieBloc _movieBloc = context.read<MovieBloc>();
              _movieBloc.add(SearchMovie(title: value));
            },
          ),
          Expanded(
            child: BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  return Column();
                } else if (state is MovieLoading) {
                  return const MovieSkeleton();
                } else if (state is MovieLoaded) {
                  if (state.movie.isNotEmpty) {
                    return MovieBuilder(movieLoaded: state);
                  } else {
                    return Center(
                      child: Text(
                        'Mahasiswa tidak ditemukan!',
                        style: mediumText(13),
                      ),
                    );
                  }
                } else if (state is MovieError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: mediumText(13),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      'Terjadi kesalahan!',
                      style: mediumText(13),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
