import 'package:chupp/pages/main/profile.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniProfile extends StatelessWidget {
  const MiniProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        onTap: () => Navigator.push(
          context,
          BasicPageRoute(
            start: Start.right,
            child: const ProfilePage.uid(uid: "userUid"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Row(
            children: [
              const ProfilePhoto(
                radius: 24,
                image: NetworkImage("https://picsum.photos/1920/1080"),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "username",
                    style: context.styles.title3,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "User Name",
                    style: context.styles.mutted,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.droplet,
                        color: context.theme.current.subText,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppManager.numFormat(4600),
                        style: context.styles.mutted,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "${AppManager.numFormat(12)} ${context.lang.current.createdPostsSuffix}",
                        style: context.styles.mutted,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
