import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/movie_provider.dart';

import 'views/splash_screen.dart';
import 'views/movie_list.dart';
import 'views/movie_update.dart';
import 'views/movie_page.dart';

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
          initialRoute: '/splash_screen',
          routes: {
            '/splash_screen': (context) => const SplashScreen(),
            '/movie_list': (context) => const MovieList(),
            '/movie_update': (context) => const MovieUpdate(),
            '/movie_page': (context) => const MoviePage(),
          },
        );
      },
    );
  }
}
