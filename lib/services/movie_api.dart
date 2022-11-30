import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/movie.dart';

class MovieApi {
  static final Dio _dio = Dio(
    BaseOptions(
        connectTimeout: 8000,
        receiveTimeout: 8000,
        baseUrl: Constant.apiUrl,
        headers: {
          'Accept': 'application/json',
        }),
  );

  static Future getMovie() async {
    try {
      // rest api
      Response response = await _dio.get('/movie');

      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future searchMovie({
    required String title,
  }) async {
    try {
      // rest api
      Response response = await _dio.get(
        '/movie/search',
        queryParameters: {
          'title': title,
        },
      );

      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future createMovie({
    required FormData data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/movie/create',
        queryParameters: {
          'data': data,
        },
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future updateMovie({
    required FormData data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/movie/update',
        queryParameters: {
          'data': data,
        },
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );

      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future deleteMovie({
    required Map<String, dynamic> data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/movie/delete',
        queryParameters: {
          'data': data,
        },
      );

      return Movie.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }
}
