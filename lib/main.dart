import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/movie/movie_bloc.dart';
import 'blocs/stepper/stepper_cubit.dart';
import 'blocs/dropdown/dropdown_cubit.dart';
import 'blocs/image/image_bloc.dart';

import 'views/movie/page/movie_page.dart';
import 'views/movie/detail/movie_detail.dart';
import 'views/form/movie_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
        BlocProvider(
          create: (context) => StepperCubit(),
        ),
        BlocProvider(
          create: (context) => DropdownCubit(),
        ),
        BlocProvider(
          create: (context) => ImageBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        initialRoute: '/movie_page',
        routes: {
          '/movie_page': (context) => const MoviePage(),
          '/movie_detail': (context) => const MovieDetail(),
          '/movie_form': (context) => const MovieForm(),
        },
      ),
    );
  }
}
