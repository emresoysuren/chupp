import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/mini_content_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MiniContentHeader(
              username: "username",
              time: "5/30/14 19:26",
            ),
            const SizedBox(height: 8),
            ExpandableText(
              "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
              style: context.styles.text,
            ),
            const SizedBox(height: 4),
            SinglePlainTextButton(
              icon: const FaIcon(FontAwesomeIcons.droplet).icon,
              iconSize: 16,
              label: "4.6k",
              gap: 4,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
