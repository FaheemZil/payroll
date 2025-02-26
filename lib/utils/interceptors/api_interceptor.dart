// lib/utils/interceptors/api_interceptor.dart

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:logger/web.dart';
import 'package:myapp/core/config/env/env.dart';
import 'package:myapp/core/widgets/calert_dialog.dart';
import 'package:myapp/data/controllers/auth_controller.dart';
import 'package:myapp/data/controllers/loader_controller.dart';
import 'package:myapp/data/models/error_resoponse.dart';
import 'package:myapp/utils/dio_logger.dart';

import '../../core/config/env/staging_env.dart';

class ApiInterceptor extends Interceptor {
  // final Logger _logger = Logger();
  final Env _env = Get.find<Env>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = _env.baseUrl;
    // if (_authService.token != null) {
    //   options.headers['Authorization'] = 'Bearer ${_authService.token}';
    // }

    // Add common headers
    options.headers.addAll({
      // 'authorization': 'Bearer ${user?.token}',
      'api-request-from': 'mob',
      'accept': 'application/json',
      // 'companyid': '${user?.companyId}',
      // 'Browser-Token': user?.browserToken,
    });
    if (_env is StagingEnv) {
      // Only log in staging
      // _logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
      // _logger.d('Request Headers: ${options.headers}');
      // if (options.data != null) {
      //   _logger.t('Request Body: ${options.data}');
      // }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Debug logging
    if (_env is StagingEnv) {
      // _logger.i(
      //   'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      // );
      // _logger.t('Response Body: ${response.data}');
    }

    super.onResponse(response, handler);
  }
}

class ErrorInterceptor extends Interceptor {
  // final Logger _logger = Logger();
  final Env _env = Get.find<Env>();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Log detailed error information in Staging or Production (or other environments)
    if (_env is StagingEnv) {}

    // Handle Unauthorized (401) error
    if (err.response?.statusCode == 401) {
      // Handle logout if needed (e.g., _authService.logout())
      Get.offAllNamed('/login');
      return handler.next(err); // Continue processing the error after handling
    }

    // Parse and get the error message
    final errorMessage = _parseError(err);
    // _logger.e(
    //   'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
    //   'Request Data: $errorMessage\n'
    //   'Headers: ${err.requestOptions.headers}\n'
    //   'Error Response: ${err.response?.data}\n',
    //   error: err,
    //   stackTrace: err.stackTrace,
    // );

    // Show the error message in a custom alert dialog
    cAlertDialog(
      buttonText: 'Cancel',
      alert: AlertType.error,
      onTap: () => Get.back(),
      title: 'Oops!',
      subtitle: errorMessage,
    );

    // Update the error with the parsed message
    err = err.copyWith(error: errorMessage);

    // Log the error message at the debug level
    // _logger.d('Parsed error message: $errorMessage');

    // Pass the error to the next handler
    super.onError(err, handler);
    handler.next(err);
  }

  String _parseError(DioException err) {
    final String errorCode = '[Code: ${err.response?.statusCode ?? 'Unknown'}]';
    try {
      // Parsing the error response from the server
      final ErrorResponse response = ErrorResponse.fromJson(
        err.response!.data! as Map<String, dynamic>,
      );

      final String? serverMessage = response.errorMsg ?? response.message;

      final String clientMessage =
          err.response?.statusMessage ?? 'An error has occurred!';

      final String errorMessage = serverMessage ?? '$clientMessage $errorCode';

      return errorMessage;
    } catch (_) {
      // Fallback in case the error message parsing fails
      final String errorMessage =
          err.response?.statusMessage ?? 'Something went wrong!';
      return errorMessage;
    }
  }
}

class DioLoaderInterceptor implements Interceptor {
  final loader = Get.find<LoaderController>();

  @override
  void onError(DioException exception, ErrorInterceptorHandler handler) {
    loader.hideLoader();
    handler.next(exception);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    loader.showLoader();
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    loader.hideLoader();
    handler.next(response);
  }
}

class LoggerInterceptor extends Interceptor {
  final Logger _logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    DioLogger().request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    _logger.t('Response Body: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\n'
      'Request Data: ${err.requestOptions.data}\n'
      'Headers: ${err.requestOptions.headers}\n'
      'Error Response: ${err.response?.data}\n',
      error: err,
      stackTrace: err.stackTrace,
    );

    super.onError(err, handler);
  }
}
