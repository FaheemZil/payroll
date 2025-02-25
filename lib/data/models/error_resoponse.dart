class ErrorResponse {
  final bool? success;
  final String? errorMsg;
  final String? message;
  final dynamic errorCode;

  const ErrorResponse({
    this.success,
    this.errorMsg,
    this.message,
    this.errorCode,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      success: json['success'] as bool?,
      errorMsg: json['errorMsg'] as String?,
      message: json['message'] as String?,
      errorCode: json['errorCode'],
    );
  }
}
