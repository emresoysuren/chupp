import 'package:chupp/apis/server/api.dart';

class DataService {
  DataService._();

  // STATUS | May need change

  static bool get loggedIn => ServerApi.instance.currentUser != null;

  static String? get uid => ServerApi.instance.currentUser?.uid;

  // STATUS | Auth Methods

  static Future<void> register(String email, String password) =>
      ServerApi.instance.register(
        email: email,
        password: password,
      );

  static Future<void> login(String email, String password) =>
      ServerApi.instance.login(
        email: email,
        password: password,
      );

  static Future<void> signOut() => ServerApi.instance.logout();

  // STATUS | Need change

  // User Profile Methods

  // static Future<void> userRegister(String username, String about) async {}

  // static Future<OwnerProfile?> getCurrentUser() async {}

  // STATUS | Temporarily blocked

  static signInAnonymously() => throw "";

  static googleLogin() => throw "";

  static appleLogin() => throw "";

  static bool? get isAnonymous => null;
}
