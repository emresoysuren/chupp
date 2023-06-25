import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/custom/like.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/content_header.dart';
import 'package:chupp/widgets/posts/poll/poll.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final bool openDescription;

  final GlobalKey? contentKey;

  const PostWidget({
    super.key,
    this.openDescription = false,
    this.contentKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: contentKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header - START
        const ContentHeader(
          username: "username",
          time: "5/30/14 19:26",
          children: [
            LikeButton(amount: 120),
          ],
        ),
        // Header - END
        const SizedBox(height: 16),
        // Hashtags - START
        const Wrap(
          runSpacing: 8,
          spacing: 8,
          children: [
            HashtagChip(tag: "anime"),
            HashtagChip(tag: "theory"),
          ],
        ),
        // Hashtags - END
        const SizedBox(height: 8),
        Text(
          "Which character is more likely to die next?",
          style: context.styles.title2,
        ),
        const SizedBox(height: 8),
        ExpandableText(
          "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
          style: context.styles.text,
          expanded: openDescription,
          active: !openDescription,
          characterThresold: 140,
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Poll(),
        ),
      ],
    );
  }
}
