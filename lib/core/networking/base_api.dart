import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../errors/exceptions.dart';
import '../errors/model/error_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class ApiBase {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4N2RhM2ViMzk1OWMzNTkwMTY0NjM2NTZjOTNmM2I1NyIsIm5iZiI6MTc5MTI3NDc2OS4zODUsInN1YiI6IjZhYzRhZjExZjI5YWQ5MjdkYmRjZDhjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ZrHYoBztva9CfJn233Z3mgD27V95PhhcOZlgzgdtSR8',
    'accept': 'application/json',
  };

  final Dio dio = Dio();

  ApiBase() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = headers;
    final response = await dio.get(
      '$_baseUrl$path',
      queryParameters: queryParameters,
    );

    return returnResponse(response).data;
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = headers;
    final response = await dio.post(
      '$_baseUrl$path',
      data: data,
      queryParameters: queryParameters,
    );

    return returnResponse(response).data;
  }

  Response returnResponse(Response? response) {
    if (response == null) {
      throw ErrorModel(message: "There is no data");
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw ServerException(
          message: response.data['message'],
          errorMap: response.data["errors"],
        );
      case 422:
        throw ServerException(
          message: response.data['message'],
          errorMap: response.data["errors"],
        );
      case 401:
        throw ServerException(message: response.data['message']);
      case 500:
        throw ServerException(message: "Server Error");
      default:
        throw ServerException(message: "We will fix it soon");
    }
  }
}
