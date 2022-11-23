import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/movie_provider.dart';

import 'views/splash_screen.dart';
import 'views/movie/page/movie_page.dart';
import 'views/movie/movie_update.dart';
import 'views/movie/detail/movie_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieProvider>(
      create: (BuildContext context) => MovieProvider(),
      builder: (BuildContext context, Widget? widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
          ),
          initialRoute: '/movie_list',
          routes: {
            '/movie_list': (context) => const MovieList(),
            '/movie_update': (context) => const MovieUpdate(),
            '/movie_page': (context) => const MoviePage(),
          },
        );
      },
    );
  }
}
