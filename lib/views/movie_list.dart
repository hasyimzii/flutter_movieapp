import 'package:flutter/material.dart';
import '../widgets/scaffold_theme.dart';
import '../widgets/list_content.dart';
import '../widgets/submit_button.dart';
import '../models/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  // movie class models
  final List movies = [
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

  @override
  Widget build(BuildContext context) {
    // looping widget list from model
    final children = <Widget>[];
    for (var i = 0; i < movies.length; i++) {
      children.add(
        ListContent(
          leading: movies[i].poster,
          title: movies[i].title,
          subtitle: movies[i].director,
          onTapArgs: movies[i], // pass arguments to next page
        ),
      );
    }
    // add button without args
    children.add(Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SubmitButton(
        title: 'Next Page',
        icon: Icons.keyboard_tab,
        onTap: () {
          Navigator.pushNamed(context, '/movie_detail');
        },
      ),
    ));

    return ScaffoldTheme(
      title: 'Movie List',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // get the widget list
          children: children,
        ),
      ),
    );
  }
}
