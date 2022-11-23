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

  static Future createBlog({
    required Map<String, dynamic> data,
  }) async {
    try {
      // rest api
      Response response = await _dio.get(
        '/movie/create',
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

  static Future updateBlog({
    required Map<String, dynamic> data,
  }) async {
    try {
      // rest api
      Response response = await _dio.get(
        '/movie/update',
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
