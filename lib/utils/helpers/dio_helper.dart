import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/utils/interceptors/api_interceptor.dart';

Dio get client {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: kDebugMode ? 10000 : 60000),
    ),
  );

  dio.interceptors.add(ApiInterceptor());

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  dio.interceptors.add(ErrorInterceptor());
  return dio;
}

extension DioExtension on Dio {
  /// Removes loader interceptor from client
  Dio get hideLoader {
    interceptors.removeWhere((element) => element is DioLoaderInterceptor);
    return this;
  }

  /// Client without error message dialog
  Dio get hideMessage {
    interceptors.removeWhere((element) => element is ErrorInterceptor);
    return this;
  }
}
