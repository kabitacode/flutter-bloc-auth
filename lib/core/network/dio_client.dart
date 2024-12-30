import 'package:dio/dio.dart';

import 'interceptors.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
              headers: {'Content-Type': 'application/json; charset=UTF-8'},
              responseType: ResponseType.json,
              sendTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10)),
        )..interceptors.addAll([LoggerInterceptor()]);

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParamaeters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(url,
          data: data,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
