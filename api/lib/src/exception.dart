class ChuppApiException extends Error {
  final ChuppApiExceptionType type;
  final String message;

  ChuppApiException(this.type, this.message);
}

enum ChuppApiExceptionType {
  error1xx,
  error3xx,
  error4xx,
  error5xx,
  timeout,
  unknown,
  userNotFound;
}
