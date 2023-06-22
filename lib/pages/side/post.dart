import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/add_opinion.dart';
import 'package:chupp/widgets/posts/poll/poll.dart';
import 'package:chupp/widgets/posts/user_opinion.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final GlobalKey _contentKey = GlobalKey();
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.theme.current.primaryBg,
      appBar: ContentBar(controller: _controller, contentKey: _contentKey),
      body: DisableScrollBehavior(
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  key: _contentKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            // Direct to user's profile
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "username",
                                    style: Styles.text,
                                  ),
                                  Text(
                                    "5/30/14 19:26",
                                    style: Styles.subText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        SinglePlainTextButton(
                          icon: const FaIcon(FontAwesomeIcons.solidHeart).icon,
                          iconSize: 16,
                          label: "1.2k",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Hashtags - START
                    SizedBox(
                      height: 18,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) =>
                            const HashtagChip(tag: "anime"),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 8),
                      ),
                    ),
                    // Hashtags - END
                    const SizedBox(height: 8),
                    Text(
                      "Which character is more likely to die next?",
                      style: Styles.title2,
                    ),
                    const SizedBox(height: 8),
                    ExpandableText(
                      "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                      style: Styles.text,
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Poll(),
                    ),
                  ],
                ),
                // Opinions - START
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Texts.postOpinionsTitle,
                        style: Styles.title3,
                      ),
                      const SizedBox(height: 8),
                      for (int i = 0; i < 6; i++)
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: UserOpinion(),
                        ),
                    ],
                  ),
                ),
                // Opinions - END
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AddOpinion(),
    );
  }
}
