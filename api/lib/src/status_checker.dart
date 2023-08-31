import 'dart:convert';
import 'package:chupp_api/api.dart';
import 'package:http/http.dart' as http;
import 'messages/errors.dart';

class StatusChecker {
  StatusChecker._();

  /// Checks the response status and returns from the function if the status is 2XX.
  ///
  /// If the status is not 2XX, throws an error.
  ///
  /// The error message can be specified in the responde,
  /// but if it's not the error message will be the corresponding
  /// error type's (4XX, 5XX) default message.
  static void check(http.Response response) {
    final int code = response.statusCode;
    final int type = code ~/ 100;

    // If the responde is OK return.
    if (type == 2) return;

    // If the responde is not OK, check if there is a error sent.
    dynamic json;
    try {
      json = jsonDecode(response.body);
    } catch (_) {
      json = jsonDecode(jsonEncode(response.body));
    }

    final String? errorMessage = _getErrorMessage(json);

    // If couldn't find an error message return the default
    // error message for the api.
    switch (type) {
      case 1:
        throw ChuppApiException(
          ChuppApiExceptionType.error1xx,
          errorMessage ?? ChuppApiErrorMessages.error1XX,
        );
      case 3:
        throw ChuppApiException(
          ChuppApiExceptionType.error3xx,
          errorMessage ?? ChuppApiErrorMessages.error3XX,
        );
      case 4:
        throw ChuppApiException(
          ChuppApiExceptionType.error4xx,
          errorMessage ?? ChuppApiErrorMessages.error4XX,
        );
      case 5:
        throw ChuppApiException(
          ChuppApiExceptionType.error5xx,
          errorMessage ?? ChuppApiErrorMessages.error5XX,
        );
      default:
        throw ChuppApiException(
          ChuppApiExceptionType.unknown,
          errorMessage ?? ChuppApiErrorMessages.errorUnknown,
        );
    }
  }

  static String? _getErrorMessage(dynamic json) {
    if (json is Map<String, dynamic>) {
      final error = json["error"];
      if (error is String) {
        return error;
      }
    }
    return null;
  }
}
