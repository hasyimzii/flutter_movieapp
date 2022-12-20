import 'package:flutter/material.dart';

import '../views/movie/page/movie_page.dart';
import '../views/movie/detail/movie_detail.dart';
import '../views/form/movie_form.dart';

class Routes {
  // route list
  static String moviePage = '/movie_page';
  static String movieDetail = '/movie_detail';
  static String movieForm = '/movie_form';

  // route map
  static Map<String, WidgetBuilder> routes = {
    moviePage: (context) => const MoviePage(),
    movieDetail: (context) => const MovieDetail(),
    movieForm: (context) => const MovieForm(),
  };
}
