import 'dart:convert';
import 'dart:io';
import 'package:chupp_api/api.dart';
import 'package:chupp_api/src/messages/errors.dart';
import 'package:chupp_api/src/status_checker.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class Session {
  Session();

  final http.Client _client = http.Client();

  final Map<String, Cookie> _cookies = {};

  String get baseUrl => ChuppApiConfig.baseUrl;

  Duration get timeLimit => ChuppApiConfig.timeLimit;

  Uri toUrl(String path) => Uri.parse(baseUrl + path);

  /// Gets the cookies value only
  String? getCookieValue(String cookie) => _cookies[cookie]?.value;

  /// Get the cookies
  Map<String, Cookie> get cookies => _cookies;

  /// Deletes the cookie from the cookies
  void deleteCookie(String name) => _cookies.remove(name);

  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    headers ??= {};
    headers.addAll(_rawCookies);

    http.Response response = await _client
        .get(
          toUrl(path),
          headers: headers,
        )
        .timeout(
          timeLimit,
          onTimeout: () => throw ChuppApiException(
            ChuppApiExceptionType.timeout,
            ChuppApiErrorMessages.timeout,
          ),
        );

    _updateCookies(response);

    StatusChecker.check(response);

    return response;
  }

  Future<http.Response> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    headers ??= {};
    headers.addAll(_rawCookies);

    http.Response response = await _client
        .post(
          toUrl(path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .timeout(
          timeLimit,
          onTimeout: () => throw ChuppApiException(
            ChuppApiExceptionType.timeout,
            ChuppApiErrorMessages.timeout,
          ),
        );

    _updateCookies(response);

    StatusChecker.check(response);

    return response;
  }

  /// Updates the cookies with the new set-cookie responses
  void _updateCookies(http.Response response) {
    final String? rawSetCookies = response.headers[HttpHeaders.setCookieHeader];
    if (rawSetCookies == null || rawSetCookies.isEmpty) return;
    final List<String> setCookies = rawSetCookies.split(RegExp("=.*,=.*"));
    for (var setCookie in setCookies) {
      final Cookie cookie = Cookie.fromSetCookieValue(setCookie);
      if (cookie.value.isEmpty) {
        deleteCookie(cookie.name);
      }
      _cookies[cookie.name] = cookie;
    }
  }

  /// Makes the stored cookies ready to send with a request
  Map<String, String> get _rawCookies {
    List<String> values = [];
    for (var cookie in _cookies.entries) {
      final String rawCookie = "${cookie.key}=${cookie.value.value}";
      values.add(rawCookie);
    }
    final String rawValues = values.join(";");

    return {
      "cookie": rawValues,
    };
  }
}
