import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';

import '../widgets/app_layout.dart';
import '../widgets/text_field_input.dart';
import '../widgets/submit_button.dart';
import '../models/movie.dart';

class MovieUpdate extends StatelessWidget {
  const MovieUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controllers
    String pageText = 'Create Movie';
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController poster = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController director = TextEditingController();

    // define the arguments
    Object? args = ModalRoute.of(context)?.settings.arguments;
    int? index;
    Movie? movie;

    // if argument passed
    if (args is Map<String, dynamic>) {
      if (args['index'] is int && args['movie'] is Movie) {
        // change title & submit text
        pageText = 'Edit Movie';

        // change controllers
        index = args['index'];
        movie = args['movie'];
        poster = TextEditingController(text: movie!.poster);
        title = TextEditingController(text: movie.title);
        director = TextEditingController(text: movie.director);
      }
    }

    return ScaffoldTheme(
      title: pageText,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFieldInput(
                label: 'Poster Url',
                text: poster,
                validator: (String? value) {
                  if (value?.isEmpty ?? true) return 'required';
                },
              ),
              const SizedBox(height: 15),
              TextFieldInput(
                label: 'Title',
                text: title,
                validator: (String? value) {
                  if (value?.isEmpty ?? true) return 'required';
                },
              ),
              const SizedBox(height: 15),
              TextFieldInput(
                label: 'Director',
                text: director,
                validator: (String? value) {
                  if (value?.isEmpty ?? true) return 'required';
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: SubmitButton(
                  title: pageText,
                  icon: Icons.save,
                  onTap: () {
                    // validate form
                    if (!(_formKey.currentState?.validate() ?? false)) return;
                    // get provider read
                    MovieProvider provider = context.read<MovieProvider>();
                    // if edit
                    if (movie != null) {
                      provider.editMovie(
                        index!,
                        Movie(
                          poster.text,
                          title.text,
                          director.text,
                        ),
                      );
                      // if create
                    } else {
                      provider.createMovie(
                        Movie(
                          poster.text,
                          title.text,
                          director.text,
                        ),
                      );
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
