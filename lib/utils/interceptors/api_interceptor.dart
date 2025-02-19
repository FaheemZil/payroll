// lib/utils/interceptors/api_interceptor.dart

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:payroll_by_cc/core/config/env/env.dart';
import 'package:payroll_by_cc/services/auth_service.dart';

import '../../core/config/env/staging_env.dart';

class ApiInterceptor extends dio.Interceptor {
  final Logger _logger = Logger();
  final Env _env = Get.find<Env>();
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    // Add environment-aware base URL
    options.baseUrl = _env.baseUrl;

    // Add authorization header if token exists
    if (_authService.hasToken) {
      options.headers['Authorization'] = 'Bearer ${_authService.token}';
    }

    // Add common headers
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'X-Platform': '${GetPlatform.isMobile ? 'mobile' : 'web'}',
      'X-App-Version': '1.0.0',
    });

    // Debug logging
    if (_env is StagingEnv) { // Only log in staging
      _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
      _logger.d('Request Headers: ${options.headers}');
      if (options.data != null) {
        _logger.v('Request Body: ${options.data}');
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) {
    // Debug logging
    if (_env is StagingEnv) {
      _logger.i(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
      _logger.v('Response Body: ${response.data}');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(dio.DioException err, dio.ErrorInterceptorHandler handler) async {
    if (_env is StagingEnv) {
      _logger.e(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        error: err,
        stackTrace: err.stackTrace,
      );
    }

    // Handle token expiration (401 errors)
    if (err.response?.statusCode == 401) {
      await _authService.logout();
      Get.offAllNamed('/login');
      return handler.next(err);
    }

    // Parse custom error messages
    final errorMessage = _parseError(err);
    err = err.copyWith(error: errorMessage);

    super.onError(err, handler);
  }

  String _parseError(dio.DioException error) {
    try {
      if (error.response?.data is Map<String, dynamic>) {
        return error.response?.data['message'] ??
            error.response?.statusMessage ??
            error.message ??
            'Unknown error occurred';
      }
      return error.response?.statusMessage ?? error.message ?? 'Unknown error';
    } catch (e) {
      return 'Failed to parse error message';
    }
  }
}