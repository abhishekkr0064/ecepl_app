enum ExceptionType {
  noInternet,
  timeout,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  serverError,
  unknown,
}

class AppException implements Exception {
  final String message;
  final ExceptionType type;

  const AppException(this.message, {this.type = ExceptionType.unknown});

  @override
  String toString() => message;

  bool get isNoInternet => type == ExceptionType.noInternet;
  bool get isTimeout => type == ExceptionType.timeout;
  bool get isUnauthorized => type == ExceptionType.unauthorized;
  bool get isServerError => type == ExceptionType.serverError;
}
