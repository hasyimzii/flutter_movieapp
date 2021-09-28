import 'package:flutter/material.dart';
import 'views/splash_screen.dart';
import 'views/movie_list.dart';
import 'views/movie_detail.dart';
import 'views/movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        '/movie_detail': (context) => const MovieDetail(),
        '/movie_page': (context) => const MoviePage(),
      },
    );
  }
}
