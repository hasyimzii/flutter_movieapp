import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/list_content.dart';
import '../widgets/submit_button.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Movie List',
      body: Column(
        children: [
          Expanded(
            child: Consumer<MovieProvider>(
              builder: (
                BuildContext context,
                MovieProvider movies,
                Widget? child,
              ) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: movies.moviesLength,
                  itemBuilder: (BuildContext context, int index) {
                    return ListContent(
                      leading: movies.movies[index].poster,
                      title: movies.movies[index].title,
                      subtitle: movies.movies[index].director,
                      onTapArgs: <String, dynamic>{
                        'index': index,
                        'movie': movies.movies[index],
                      },
                      onDelete: () => movies.deleteMovie(movies.movies[index]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SubmitButton(
              title: 'Create Movie',
              icon: Icons.add_box_rounded,
              onTap: () {
                Navigator.pushNamed(context, '/movie_update');
              },
            ),
          ),
        ],
      ),
    );
  }
}
