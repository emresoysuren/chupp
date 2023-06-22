import 'package:chupp/pages/side/post.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniPost extends StatelessWidget {
  const MiniPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        splashColor: Colors.transparent,
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
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 16,
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "username",
                          style: context.styles.text,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "5/30/14 19:26",
                          style: context.styles.subText,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Which character is more likely to die next?",
                      style: context.styles.title3,
                    ),
                    const SizedBox(height: 8),
                    ExpandableText(
                      "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                      style: context.styles.text,
                      active: false,
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Poll(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SinglePlainTextButton(
                    icon: const FaIcon(FontAwesomeIcons.droplet).icon,
                    iconSize: 16,
                    label: "4.6k",
                    gap: 4,
                    onPressed: () => Navigator.push(
                      context,
                      BasicPageRoute(
                        start: Start.right,
                        child: const PostPage(),
                      ),
                    ),
                  ),
                  SinglePlainTextButton(
                    icon: const FaIcon(FontAwesomeIcons.solidMessage).icon,
                    iconSize: 16,
                    label: "308",
                    onPressed: () => Navigator.push(
                      context,
                      BasicPageRoute(
                        start: Start.right,
                        child: const PostPage(openOpinion: true),
                      ),
                    ),
                  ),
                  SinglePlainTextButton(
                    icon: const FaIcon(FontAwesomeIcons.solidHeart).icon,
                    iconSize: 18,
                    label: "1.2k",
                    gap: 4,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
