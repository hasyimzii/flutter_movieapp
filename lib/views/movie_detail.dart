import 'package:flutter/material.dart';
import '../widgets/scaffold_theme.dart';
import '../widgets/text_field_input.dart';
import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controllers
    TextEditingController poster = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController director = TextEditingController();

    // get arguments value
    final Movie args = ModalRoute.of(context)!.settings.arguments as Movie;

    // change controllers
    poster = TextEditingController(text: args.poster);
    title = TextEditingController(text: args.title);
    director = TextEditingController(text: args.director);

    return ScaffoldTheme(
      title: 'Movie Detail',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFieldInput(
              label: 'Poster Url',
              text: poster,
            ),
            const SizedBox(height: 30),
            TextFieldInput(
              label: 'Title',
              text: title,
            ),
            const SizedBox(height: 30),
            TextFieldInput(
              label: 'Director',
              text: director,
            ),
          ],
        ),
      ),
    );
  }
}
