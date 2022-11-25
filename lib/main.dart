import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/movie/movie_bloc.dart';

import 'views/movie/page/movie_page.dart';
import 'views/movie/detail/movie_detail.dart';
// import 'views/movie/movie_update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(),
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
          // '/movie_update': (context) => const MovieUpdate(),
        },
      ),
    );
  }
}
