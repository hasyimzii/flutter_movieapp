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
    MovieData _movie = args['movie'];

    return AppLayout(
      title: 'Movie Details',
      body: PanelWidget(
        image: _movie.image,
        panel: MoviePanel(
          title: _movie.title,
          director: _movie.director,
          year: _movie.year,
          rating: _movie.rating.toString(),
          runtime: _movie.runtime,
          age: _movie.age,
          genre: _movie.genre,
          description: _movie.description,
          url: _movie.url,
        ),
      ),
    );
  }
}
