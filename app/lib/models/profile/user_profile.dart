class UserProfile {
  final String username;
  final String about;
  final dynamic photo;
  final int followers;

  const UserProfile({
    required this.username,
    required this.about,
    this.photo,
    required this.followers,
  });

  UserProfile.fromMap(Map<String, dynamic> map)
      : this(
          username: map["username"],
          about: map["about"],
          photo: map["photo"],
          followers: map["followers"],
        );

  Map<String, dynamic> toMap() => {
        "username": username,
        "about": about,
        "photo": photo,
        "followers": followers,
      };
}
