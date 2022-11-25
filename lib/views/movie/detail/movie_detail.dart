import 'package:flutter/material.dart';

import '../../../models/movie.dart';

import '../../../widgets/app_layout.dart';
import '../../../widgets/panel_widget.dart';

import 'movie_panel.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    MovieData movie = args['movie'];

    return AppLayout(
      title: 'Movie Details',
      floatingButton: Column(),
      body: PanelWidget(
        image: movie.image,
        panel: MoviePanel(
          title: movie.title,
          director: movie.director,
          year: movie.year,
          rating: movie.rating.toString(),
          runtime: movie.runtime,
          age: movie.age,
          genre: movie.genre,
          description: movie.description,
          url: movie.url,
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/movie_form',
            arguments: {
              'movie': movie,
            },
          );
        },
      ),
    );
  }
}
