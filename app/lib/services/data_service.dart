import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  static String? get uid => FirebaseAuth.instance.currentUser?.uid;

  static Future<UserCredential> emailRegister(String email, String password) =>
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  static Future<UserCredential> emailLogin(String email, String password) =>
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  static Future<UserCredential> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // It won't work due to the Apple Developer Program
  static Future<UserCredential> appleLogin() async {
    final appleProvider = AppleAuthProvider();
    if (kIsWeb) {
      return await FirebaseAuth.instance.signInWithPopup(appleProvider);
    } else {
      return await FirebaseAuth.instance.signInWithProvider(appleProvider);
    }
  }

  static Future<void> userRegister(String username, String about) async {
    final Map<String, dynamic> data = {
      "username": username,
      "about": about,
    };
    await FirebaseFunctions.instance.httpsCallable("register_user").call(data);
  }
}
