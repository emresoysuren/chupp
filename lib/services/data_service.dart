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

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static bool? get isAnonymous =>
      FirebaseAuth.instance.currentUser?.isAnonymous;

  static bool get loggedIn => FirebaseAuth.instance.currentUser != null;
}
