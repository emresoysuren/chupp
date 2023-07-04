import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HashtagHeader extends StatelessWidget {
  final String title;
  final int? ink;
  final int? comment;
  final int? like;

  const HashtagHeader({
    super.key,
    required this.title,
    this.ink,
    this.comment,
    this.like,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.current.primaryBg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
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
                const SizedBox(width: 16),
                FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: context.theme.current.text,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  AppManager.numFormat(like),
                  style: context.styles.text,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Button(
              label: context.lang.current.hashtagFollow,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
