import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/custom/mini_button.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHeader extends StatelessWidget {
  final String title;
  final int? follower;
  final int? ink;
  final int? comment;
  final bool isOwner;

  const ProfileHeader({
    super.key,
    required this.title,
    this.follower,
    this.ink,
    this.comment,
    this.isOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.current.primaryBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.styles.title2,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidUser,
                          color: context.theme.current.text,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppManager.numFormat(follower),
                          style: context.styles.text,
                        ),
                        const SizedBox(width: 16),
                        FaIcon(
                          FontAwesomeIcons.droplet,
                          color: context.theme.current.text,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppManager.numFormat(ink),
                          style: context.styles.text,
                        ),
                        const SizedBox(width: 16),
                        FaIcon(
                          FontAwesomeIcons.solidMessage,
                          color: context.theme.current.text,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppManager.numFormat(comment),
                          style: context.styles.text,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ExpandableText(
              "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
              style: context.styles.text,
              reuseable: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: isOwner
                  ? MiniButton(
                      label: Texts.profileEditProfile,
                      onPressed: () {},
                    )
                  : MiniButton(
                      label: Texts.profileFollow,
                      onPressed: () {},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
