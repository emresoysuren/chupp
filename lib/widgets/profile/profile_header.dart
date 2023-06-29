import 'package:chupp/config/texts.dart';
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

  const ProfileHeader({
    super.key,
    required this.title,
    this.follower,
    this.ink,
    this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.current.primaryBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          (follower ?? 0).toString(),
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
                          (ink ?? 0).toString(),
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
                          (comment ?? 0).toString(),
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
              "Veniam et sint excepteur pariatur cillum quis tempor deserunt commodo enim sunt.",
              style: context.styles.text,
              reuseable: true,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: MiniButton(
                label: Texts.hashtagFollow,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
