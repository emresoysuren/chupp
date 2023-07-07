import 'package:chupp/models/profile/user_profile.dart';

class OwnerProfile extends UserProfile {
  final List following;

  const OwnerProfile({
    required super.username,
    required super.about,
    super.photo,
    required super.followers,
    required this.following,
  });

  OwnerProfile.fromMap(Map<String, dynamic> map)
      : this(
          username: map["username"],
          about: map["about"],
          photo: map["photo"],
          followers: map["followers"],
          following: map["following"],
        );

  @override
  Map<String, dynamic> toMap() => {
        "username": username,
        "about": about,
        "photo": photo,
        "followers": followers,
      };
}
