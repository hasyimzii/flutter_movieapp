import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/style.dart';

import '../../blocs/movie/movie_bloc.dart';
import '../../blocs/stepper/stepper_cubit.dart';

import '../../models/movie.dart';

import '../../widgets/app_layout.dart';
import 'step_1.dart';
import 'step_2.dart';
// import 'step_3.dart';

class MovieForm extends StatelessWidget {
  const MovieForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controllers
    String pageText = 'Create Movie';
    final List<GlobalKey<FormState>> formKey = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
    ];
    TextEditingController id = TextEditingController();
    TextEditingController title = TextEditingController();
    TextEditingController director = TextEditingController();
    TextEditingController year = TextEditingController();
    TextEditingController rating = TextEditingController();
    TextEditingController runtime = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController genre = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController url = TextEditingController();
    TextEditingController image = TextEditingController();

    // define the arguments
    final args = ModalRoute.of(context)?.settings.arguments;
    MovieData? movie;

    // if argument passed
    if (args is Map<String, dynamic>) {
      if (args['movie'] is MovieData) {
        // change title & submit text
        pageText = 'Edit Movie';

        // change controllers
        movie = args['movie'];
        id = TextEditingController(text: movie!.id.toString());
        title = TextEditingController(text: movie.title);
        director = TextEditingController(text: movie.director);
        year = TextEditingController(text: movie.year);
        rating = TextEditingController(text: movie.rating.toString());
        runtime = TextEditingController(text: movie.runtime);
        age = TextEditingController(text: movie.age);
        genre = TextEditingController(text: movie.genre);
        description = TextEditingController(text: movie.description);
        url = TextEditingController(text: movie.url);
        image = TextEditingController(text: movie.image);
      }
    }

    return AppLayout(
      title: pageText,
      floatingButton: Column(),
      body: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          return Stepper(
            type: StepperType.horizontal,
            currentStep: state.index,
            steps: [
              Step(
                isActive: state.index >= 0,
                title: Text(
                  'Step 1',
                  style: subtitleText(11),
                ),
                content: Step1(
                  formKey: formKey[0],
                  titleController: title,
                  directorController: director,
                  yearController: year,
                  runtimeController: runtime,
                  ratingController: rating,
                  ageController: age,
                ),
              ),
              Step(
                isActive: state.index >= 1,
                title: Text(
                  'Step 2',
                  style: subtitleText(11),
                ),
                content: Step2(
                  formKey: formKey[1],
                  genreController: genre,
                  urlController: url,
                  descriptionController: description,
                ),
              ),
              Step(
                isActive: state.index >= 2,
                title: Text(
                  'Step 3',
                  style: subtitleText(11),
                ),
                content: Step1(
                  formKey: formKey[state.index],
                  titleController: title,
                  directorController: director,
                  yearController: year,
                  runtimeController: runtime,
                  ratingController: rating,
                  ageController: age,
                ),
              ),
            ],
            onStepContinue: () {
              int index = state.index;
              if (!(formKey[index].currentState?.validate() ?? false)) return;

              if (index != 2) {
                final StepperCubit stepperCubit = context.read<StepperCubit>();
                stepperCubit.setStep(index += 1);
              } else {
                final MovieBloc movieBloc = context.read<MovieBloc>();
                if (movie != null) {
                  movieBloc.add(
                    UpdateMovie(
                      id: int.parse(id.text),
                      title: title.text,
                      director: director.text,
                      year: year.text,
                      rating: double.parse(rating.text),
                      runtime: runtime.text,
                      age: age.text,
                      genre: genre.text,
                      description: description.text,
                      url: url.text,
                      image: image.text,
                    ),
                  );
                } else {
                  movieBloc.add(
                    CreateMovie(
                      title: title.text,
                      director: director.text,
                      year: year.text,
                      rating: double.parse(rating.text),
                      runtime: runtime.text,
                      age: age.text,
                      genre: genre.text,
                      description: description.text,
                      url: url.text,
                      image: image.text,
                    ),
                  );
                }
              }
            },
            onStepCancel: () {
              int index = state.index;
              if (index != 2) {
                final StepperCubit stepperCubit = context.read<StepperCubit>();
                stepperCubit.setStep(index -= 1);
              }
            },
          );
        },
      ),
    );
  }
}

// Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: SubmitButton(
//                 title: pageText,
//                 icon: Icons.save,
//                 onTap: () {
//                   // validate form
//                   if (!(formKey.currentState?.validate() ?? false)) return;
//                   // get provider read
//                   MovieProvider provider = context.read<MovieProvider>();
//                   // if edit
//                   if (movie != null) {
//                     provider.editMovie(
//                       index!,
//                       Movie(
//                         poster.text,
//                         title.text,
//                         director.text,
//                       ),
//                     );
//                     // if create
//                   } else {
//                     provider.createMovie(
//                       Movie(
//                         poster.text,
//                         title.text,
//                         director.text,
//                       ),
//                     );
//                   }
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
