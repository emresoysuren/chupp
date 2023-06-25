import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/draggable_menu/post_menu.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/add_opinion.dart';
import 'package:chupp/widgets/posts/content_header.dart';
import 'package:chupp/widgets/posts/poll/poll.dart';
import 'package:chupp/widgets/posts/user_opinion.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
    this.openOpinion = false,
    this.openDescription = false,
  });

  final bool openDescription;
  final bool openOpinion;

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
      backgroundColor: context.theme.current.primaryBg,
      appBar: ContentBar(
        title: "Which character is more likely to die next?",
        controller: _controller,
        contentKey: _contentKey,
        ink: "4.6k",
        time: "5/30/14 19:26",
        onButtonTap: () => DraggableMenu.open(
          context,
          const PostMenu(),
        ),
      ),
      body: DisableScrollBehavior(
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Column(
                  key: _contentKey,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header - START
                    ContentHeader(
                      username: "username",
                      time: "5/30/14 19:26",
                      children: [
                        SinglePlainTextButton(
                          icon: const FaIcon(FontAwesomeIcons.solidHeart).icon,
                          iconSize: 16,
                          label: "1.2k",
                          onPressed: () {},
                        ),
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
                      expanded: widget.openDescription,
                      active: !widget.openDescription,
                      characterThresold: 140,
                      oneWay: true,
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Poll(),
                    ),
                  ],
                ),
              ),
              // Opinions - START
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        Texts.postOpinionsTitle,
                        style: context.styles.title3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    for (int i = 0; i < 6; i++) const UserOpinion(),
                  ],
                ),
              ),
              // Opinions - END
            ],
          ),
        ),
      ),
      bottomNavigationBar: AddOpinion(autofocus: widget.openOpinion),
    );
  }
}
