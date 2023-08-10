import 'package:chupp/apis/server/api.dart';
import 'package:chupp/models/profile/owner_profile.dart';
import 'package:chupp/models/profile/user_profile.dart';

class DataService {
  DataService._();

  // STATUS | May need change

  static bool get loggedIn => ServerApi.instance.currentUser != null;

  static String? get uid => ServerApi.instance.currentUser?.uid;

  // STATUS | Auth Methods

  static Future<void> emailRegister(String email, String password) =>
      ServerApi.instance.register(
        email: email,
        password: password,
      );

  static Future<void> emailLogin(String email, String password) =>
      ServerApi.instance.login(
        email: email,
        password: password,
      );

  static Future<void> signOut() => ServerApi.instance.logout();

  // STATUS | Need change

  // User Profile Methods

  static Future<void> userRegister(String username, String about) async {
    final Map<String, dynamic> data = {
      "username": username,
      "about": about,
    };
    await FirebaseFunctions.instance.httpsCallable("register_user").call(data);
  }

  static Future<UserProfile?> getUser(String uid) async {
    final DocumentReference<Map<String, dynamic>> userRef =
        FirebaseFirestore.instance.collection("users").doc(uid);

    final DocumentSnapshot<Map<String, dynamic>> userDoc = await userRef.get();

    final Map<String, dynamic>? userData = userDoc.data();

    if (userData?.containsKey("username") != true) return null;

    return UserProfile.fromMap(userData!);
  }

  // Owner Profile Method

  static Future<OwnerProfile?> getCurrentUser() async {
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

  // STATUS | Temporarily blocked

  static signInAnonymously() => throw "";

  static googleLogin() => throw "";

  static appleLogin() => throw "";

  static bool? get isAnonymous => null;
}
