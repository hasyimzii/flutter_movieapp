import 'package:flutter/material.dart';
import '../widgets/scaffold_theme.dart';
import '../widgets/text_field_input.dart';
import '../widgets/submit_button.dart';
import '../models/movie.dart';

class MovieUpdate extends StatelessWidget {
  const MovieUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controllers
    String pageText = 'Create Movie';
    TextEditingController poster = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController director = TextEditingController();

    // if argument passed
    if (ModalRoute.of(context)!.settings.arguments != null) {
      // change title & submit text
      pageText = 'Edit Movie';
      // get arguments value
      final Movie args = ModalRoute.of(context)!.settings.arguments as Movie;

      // change controllers
      poster = TextEditingController(text: args.poster);
      title = TextEditingController(text: args.title);
      director = TextEditingController(text: args.director);
    }

    return ScaffoldTheme(
      title: pageText,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextFieldInput(
              label: 'Poster Url',
              text: poster,
              onChanged: (value) {},
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              label: 'Title',
              text: title,
              onChanged: (value) {},
            ),
            const SizedBox(height: 15),
            TextFieldInput(
              label: 'Director',
              text: director,
              onChanged: (value) {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SubmitButton(
                title: pageText,
                icon: Icons.save,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/movie_list', (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
