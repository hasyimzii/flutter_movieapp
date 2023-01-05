import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/style.dart';
import '../../../utils/routes.dart';

import '../../../blocs/movie/movie_bloc.dart';
import '../../../blocs/stepper/stepper_cubit.dart';

import '../../../widgets/app_layout.dart';
import '../../../widgets/search_bar.dart';

import 'component/movie_builder.dart';
import 'component/movie_skeleton.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return AppLayout(
      title: 'Movie List',
      floatingButton: Padding(
        padding: const EdgeInsets.all(5),
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(
            Icons.add,
            color: whiteColor,
            size: 30,
          ),
          onPressed: () {
            final StepperCubit stepperCubit = context.read<StepperCubit>();
            stepperCubit.setStep(0);

            Navigator.pushNamed(
              context,
              Routes.movieForm,
            );
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => context.read<MovieBloc>().add(GetMovie()),
        child: Column(
          children: [
            SearchBar(
              controller: controller,
              placeholder: 'Search Movie',
              onSubmitted: (value) {
                final MovieBloc movieBloc = context.read<MovieBloc>();
                movieBloc.add(SearchMovie(title: value));
              },
            ),
            Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  // init page
                  if (state is! MovieLoaded) {
                    final MovieBloc movieBloc = context.read<MovieBloc>();
                    movieBloc.add(GetMovie());
                  }

                  // build page
                  if (state is MovieInitial) {
                    return Container();
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
      ),
    );
  }
}
