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

  static Future<dynamic> getMovie() async {
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

  static Future<dynamic> searchMovie({
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

  static Future<dynamic> createMovie({
    required FormData data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/movie/create',
        data: data,
      );

      return response.data['message'];
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future<dynamic> updateMovie({
    required int id,
    required FormData data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/movie/update/$id',
        data: data,
      );

      return response.data['message'];
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future<dynamic> deleteMovie({
    required int id,
  }) async {
    try {
      // rest api
      Response response = await _dio.delete(
        '/movie/$id',
      );

      return response.data['message'];
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
