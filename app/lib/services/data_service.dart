import 'package:chupp/models/profile/owner_profile.dart';
import 'package:chupp/models/profile/user_profile.dart';
import 'package:flutter/foundation.dart';

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

  // User Profile Methods

  static Future<UserProfile?> getUser(String uid) async {
    final DocumentReference<Map<String, dynamic>> userRef =
        FirebaseFirestore.instance.collection("users").doc(uid);

    final DocumentSnapshot<Map<String, dynamic>> userDoc = await userRef.get();

    final Map<String, dynamic>? userData = userDoc.data();

    if (userData?.containsKey("username") != true) return null;

    return UserProfile.fromMap(userData!);
  }

  // Owner Profile Method

  static Future<OwnerProfile?> getOwner() async {
    if (!loggedIn) return null;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final profileRef = FirebaseFirestore.instance.collection("users").doc(uid);
    final followingRef = profileRef.collection("details").doc("following");

    final profileDoc = await profileRef.get();
    final followingDoc = await followingRef.get();

    final profileData = profileDoc.data();
    final followingData = followingDoc.data();

    if (profileData?.containsKey("username") != true) return null;

    final Map<String, dynamic> ownerData = {
      ...profileData!,
      ...followingData!,
    };

    return OwnerProfile.fromMap(ownerData);
  }
}
