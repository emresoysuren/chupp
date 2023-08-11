import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_config.dart';

class Session {
  final http.Client _client = http.Client();

  Map<String, String> cookies = {};

  String get serverUrl => ChuppApiConfig.serverUrl;
  Uri toUrl(String path) => Uri.parse(serverUrl + path);

  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    headers ??= {};
    headers.addAll(cookies);
    http.Response response = await _client.get(toUrl(path), headers: headers);
    updateCookie(response);
    return response;
  }

  Future<http.Response> post(
    String path, {
    Object? body,
    Map<String, String>? headers,
    Encoding? encoding,
  }) async {
    headers ??= {};
    headers.addAll(cookies);
    http.Response response = await _client.post(
      toUrl(path),
      body: body,
      headers: headers,
      encoding: encoding,
    );
    updateCookie(response);
    return response;
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      cookies['cookie'] = rawCookie.split(';')[0];
    }
  }
}
