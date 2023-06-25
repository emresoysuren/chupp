import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/posts/functional/add_opinion.dart';
import 'package:chupp/widgets/posts/opinion/mini_opinion.dart';
import 'package:chupp/widgets/posts/post/post_widget.dart';
import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final bool openDescription;
  final bool openOpinion;
  final ScrollController controller;
  final GlobalKey contentKey;

  const PostContent({
    super.key,
    required this.openDescription,
    required this.controller,
    required this.contentKey,
    required this.openOpinion,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return Column(
        children: [
          Expanded(
            child: DisableScrollBehavior(
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: PostWidget(
                        openDescription: openDescription,
                        contentKey: contentKey,
                      ),
                    ),
                    // Opinions - START
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
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
                          for (int i = 0; i < 6; i++)
                            MiniOpinion(layoutMaxHeight: c.maxHeight),
                        ],
                      ),
                    ),
                    // Opinions - END
                  ],
                ),
              ),
            ),
          ),
          AddOpinion(autofocus: openOpinion),
        ],
      );
    });
  }
}
