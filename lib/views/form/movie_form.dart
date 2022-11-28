import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/style.dart';

import '../../blocs/movie/movie_bloc.dart';
import '../../blocs/stepper/stepper_cubit.dart';
import '../../blocs/image/image_bloc.dart';

import '../../models/movie.dart';

import '../../widgets/app_layout.dart';
import 'step_1.dart';
import 'step_2.dart';
import 'step_3.dart';

class MovieForm extends StatelessWidget {
  const MovieForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controllers
    String pageText = 'Create Movie';
    bool isEdit = false;
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
        isEdit = true;
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
      body: BlocListener<MovieBloc, MovieState>(
        listener: (context, movieState) {
          if (movieState is MovieCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(movieState.message),
              ),
            );
          } else if (movieState is MovieUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(movieState.message),
              ),
            );
          } else if (movieState is MovieError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 1),
                content: Text(movieState.message),
              ),
            );
          }
          Navigator.popAndPushNamed(
            context,
            '/movie_page',
          );
        },
        child: BlocBuilder<StepperCubit, StepperState>(
          builder: (context, stepState) {
            return BlocBuilder<ImageBloc, ImageState>(
              builder: (context, imageState) {
                return Stepper(
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  currentStep: stepState.index,
                  steps: [
                    Step(
                      isActive: stepState.index >= 0,
                      title: Text(
                        'Detail',
                        style: subtitleText(11),
                      ),
                      content: Step1(
                        formKey: formKey[0],
                        titleController: title,
                        directorController: director,
                        yearController: year,
                        genreController: genre,
                        runtimeController: runtime,
                        ratingController: rating,
                      ),
                    ),
                    Step(
                      isActive: stepState.index >= 1,
                      title: Text(
                        'Description',
                        style: subtitleText(11),
                      ),
                      content: Step2(
                        isEdit: isEdit,
                        formKey: formKey[1],
                        ageController: age,
                        urlController: url,
                        descriptionController: description,
                      ),
                    ),
                    Step(
                      isActive: stepState.index >= 2,
                      title: Text(
                        'Poster',
                        style: subtitleText(11),
                      ),
                      content: Step3(
                        isEdit: isEdit,
                        formKey: formKey[2],
                        imageController: image,
                        openCamera: () async {
                          final ImagePicker imagePicker = ImagePicker();
                          final XFile? imageFile = await imagePicker.pickImage(
                            source: ImageSource.camera,
                          );

                          setImage(
                            context: context,
                            imageFile: imageFile,
                          );
                        },
                        openGallery: () async {
                          final ImagePicker imagePicker = ImagePicker();
                          final XFile? imageFile = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );

                          setImage(
                            context: context,
                            imageFile: imageFile,
                          );
                        },
                      ),
                    ),
                  ],
                  onStepContinue: () {
                    int index = stepState.index;
                    if (!(formKey[index].currentState?.validate() ?? false)) {
                      return;
                    }

                    if (index != 2) {
                      final StepperCubit stepperCubit =
                          context.read<StepperCubit>();
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
                            image: (imageState is ImageLoaded)
                                ? imageState.image
                                : null,
                            oldImage: image.text,
                          ),
                        );
                      } else {
                        if (imageState is ImageLoaded) {
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
                              image: imageState.image,
                            ),
                          );
                        } else {
                          return;
                        }
                      }
                    }
                  },
                  onStepCancel: () {
                    int index = stepState.index;
                    if (index != 0) {
                      final StepperCubit stepperCubit =
                          context.read<StepperCubit>();
                      stepperCubit.setStep(index -= 1);
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  void setImage({
    required BuildContext context,
    required XFile? imageFile,
  }) {
    if (imageFile != null) {
      final ImageBloc imageBloc = context.read<ImageBloc>();
      imageBloc.add(SetImage(
        image: imageFile,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Failed to get image'),
        ),
      );
    }
  }
}
