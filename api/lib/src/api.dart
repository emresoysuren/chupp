import 'dart:convert';
import 'package:chupp_api/src/exception.dart';
import 'package:chupp_api/src/session.dart';
import 'package:http/http.dart' as http;
import 'messages/errors.dart';
import 'models/current_user.dart';

class ChuppApi {
  final Session _session = Session();

  static final instance = ChuppApi._();

  ChuppApiCurrentUser? currentUser;

  ChuppApi._();

  void _shouldLogged() {
    if (currentUser == null) {
      throw ChuppApiException(
        ChuppApiExceptionType.userNotFound,
        ChuppApiErrorMessages.errorUserNotFound,
      );
    }
  }

  /// Login the user with the given email and password.
  ///
  /// Can throw an error due to the server's respond.
  Future<void> login({
    required String email,
    required String password,
  }) async {
    final http.Response response = await _session.post(
      "/login",
      body: <String, String>{
        "email": email,
        "password": password,
      },
    );

    final body = jsonDecode(response.body);
    final uid = body["user_id"];
    currentUser = ChuppApiCurrentUser(uid: uid);
  }

  /// Register a new user with the given parameters.
  ///
  /// Can throw an error due to the server's respond.
  Future<void> register({
    required String email,
    required String password,
  }) async {
    final http.Response response = await _session.post(
      "/register",
      body: <String, String>{
        "email": email,
        "password": password,
      },
    );

    final body = jsonDecode(response.body);
    final uid = body["user_id"];
    currentUser = ChuppApiCurrentUser(uid: uid);
  }

  /// Logout the current user.
  ///
  /// Can throw an error due to the server's respond or user is not exist.
  Future<void> logout() async {
    _shouldLogged();

    await _session.post(
      "/logout",
    );

    currentUser = null;
  }

  /// Returns `true` if the server is currently working.
  Future<bool> get health async {
    try {
      await _session.get(
        "/health",
      );
    } catch (_) {
      return false;
    }

    return true;
  }
}
