import 'package:chupp/pages/side/post/post.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/custom/comment.dart';
import 'package:chupp/widgets/buttons/custom/ink.dart';
import 'package:chupp/widgets/buttons/custom/like.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/mini_content_header.dart';
import 'package:chupp/widgets/posts/poll/poll.dart';
import 'package:flutter/material.dart';

class MiniPost extends StatelessWidget {
  const MiniPost({super.key});

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
            child: const PostPage(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MiniContentHeader(
                      username: "username", time: "5/30/14 19:26"),
                  const SizedBox(height: 8),
                  Text(
                    "Which character is more likely to die next?",
                    style: context.styles.title3,
                  ),
                  const SizedBox(height: 8),
                  ExpandableText(
                    "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                    style: context.styles.text,
                    onTap: () => Navigator.push(
                      context,
                      BasicPageRoute(
                        start: Start.right,
                        child: const PostPage(openDescription: true),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Poll(),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkButton(
                    amount: 460,
                    onPressed: () => Navigator.push(
                      context,
                      BasicPageRoute(
                        start: Start.right,
                        child: const PostPage(),
                      ),
                    ),
                  ),
                  CommentButton(
                    amount: 308,
                    onPressed: () => Navigator.push(
                      context,
                      BasicPageRoute(
                        start: Start.right,
                        child: const PostPage(openOpinion: true),
                      ),
                    ),
                  ),
                  const LikeButton(amount: 120),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
