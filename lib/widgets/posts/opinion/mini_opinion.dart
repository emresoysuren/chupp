import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/custom/comment.dart';
import 'package:chupp/widgets/buttons/custom/ink.dart';
import 'package:chupp/widgets/draggable_menu/opinion_page.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/content_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class MiniOpinion extends StatelessWidget {
  final double? layoutMaxHeight;

  const MiniOpinion({super.key, this.layoutMaxHeight});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        onTap: () => DraggableMenu.open(
          context,
          OpinionPageDraggable(maxHeight: layoutMaxHeight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ContentHeader(
                username: "username",
                time: "5/30/14 19:26",
                option: "#option",
              ),
              const SizedBox(height: 8),
              ExpandableText(
                "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                style: context.styles.text,
              ),
              const SizedBox(height: 4),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkButton(amount: 460),
                  CommentButton(amount: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
