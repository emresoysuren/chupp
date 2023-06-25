import 'package:firebase_auth/firebase_auth.dart';

class DataService {
  DataService._();

  static Future<void> signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (_) {}
  }

  static Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();
}
