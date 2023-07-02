import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/main/profile.dart';
import 'package:chupp/pages/side/hashtag/hashtag.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final String username;
  final String time;
  final String? option;
  final List<Widget>? children;

  const ContentHeader({
    super.key,
    required this.username,
    required this.time,
    this.option,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => directToUser(context),
              child: const ProfilePhoto(
                radius: 18,
                image: NetworkImage("https://picsum.photos/1920/1080"),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => directToUser(context),
                      child: Text(username, style: context.styles.text),
                    ),
                    if (option != null) ...[
                      Text(
                        " ${Texts.postUserOpinionFor} ",
                        style: context.styles.mutted,
                      ),
                      GestureDetector(
                        onTap: () => directToHashtag(context),
                        child: Text(option!, style: context.styles.text),
                      ),
                    ],
                  ],
                ),
                Text(
                  time,
                  style: context.styles.mutted,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ...?children,
      ],
    );
  }

  Future<T?> directToUser<T extends Object?>(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).push<T>(
        BasicPageRoute(
          start: Start.right,
          child: const ProfilePage.uid(uid: "userUid"),
        ),
      );

  Future<T?> directToHashtag<T extends Object?>(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).push<T>(
        BasicPageRoute(
          start: Start.right,
          child: const HashtagPage(),
        ),
      );
}
