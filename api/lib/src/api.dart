import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_config.dart';
import 'messages/errors.dart';
import 'models/current_user.dart';

class ChuppApi {
  static final instance = ChuppApi._();
  final http.Client _client = http.Client();

  ServerApiCurrentUser? currentUser;

  ChuppApi._();

  String get serverUrl => ChuppApiConfig.serverUrl;

  Uri toUrl(String path) => Uri.parse(serverUrl + path);

  /// Checks the response status and returns from the function if the status is 2XX.
  ///
  /// If the status is not 2XX, throws an error.
  ///
  /// The error message can be specified in the responde,
  /// but if it's not the error message will be the corresponding
  /// error type's (4XX, 5XX) default message.
  void _statusChecker(http.Response response) {
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

    if (json is Map<String, dynamic>) {
      final error = json["error"];
      if (error is String) {
        throw error;
      }
    }

    // If couldn't find an error message return the default
    // error message for the api.
    switch (type) {
      case 1:
        throw ChuppApiErrorMessages.error1XX;
      case 3:
        throw ChuppApiErrorMessages.error3XX;
      case 4:
        throw ChuppApiErrorMessages.error4XX;
      case 5:
        throw ChuppApiErrorMessages.error5XX;
      default:
        throw ChuppApiErrorMessages.errorUnknown;
    }
  }

  /// Login the user with the given email and password.
  ///
  /// Can throw an error due to the server's respond.
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final http.Response response = await _client.post(
      toUrl("/login"),
      body: <String, String>{
        "email": email,
        "password": password,
      },
    );

    _statusChecker(response);

    final body = jsonDecode(response.body);
    final uid = body["user_id"];
    currentUser = ServerApiCurrentUser(uid: uid);
  }

  /// Register a new user with the given parameters.
  ///
  /// Can throw an error due to the server's respond.
  Future<void> register({
    required String email,
    required String password,
  }) async {
    final http.Response response = await _client.post(
      toUrl("/register"),
      body: <String, String>{
        "email": email,
        "password": password,
      },
    );

    _statusChecker(response);

    final body = jsonDecode(response.body);
    final uid = body["user_id"];
    currentUser = ServerApiCurrentUser(uid: uid);
  }

  /// Logout the current user.
  ///
  /// Can throw an error due to the server's respond.
  Future<void> logout() async {
    if (currentUser == null) {
      throw ChuppApiErrorMessages.errorUserNotFound;
    }

    final http.Response response = await _client.post(
      toUrl("/logout"),
    );

    _statusChecker(response);

    currentUser = null;
  }

  /// Returns `true` if the server is currently working.
  Future<bool> get health async {
    final http.Response response = await _client.get(
      toUrl("/health"),
    );

    try {
      _statusChecker(response);
    } catch (_) {
      return false;
    }

    return true;
  }
}
