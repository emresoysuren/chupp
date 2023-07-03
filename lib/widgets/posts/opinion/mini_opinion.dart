import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/post/post.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/custom/comment.dart';
import 'package:chupp/widgets/buttons/custom/ink.dart';
import 'package:chupp/pages/side/post/opinion_page.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/content_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class MiniOpinion extends StatelessWidget {
  final bool on;

  const MiniOpinion({
    super.key,
    this.on = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        onTap: () => on
            ? Navigator.push(
                context,
                BasicPageRoute(start: Start.right, child: const PostPage()),
              )
            : DraggableMenu.open(
                context,
                const OpinionPageDraggable(),
                barrierColor: context.theme.current.barrierColor,
              ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (on) ...[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${Texts.opinonOn} ",
                        style: context.styles.textImp
                            .copyWith(color: context.theme.current.notice),
                      ),
                      TextSpan(
                        text: "Which character is more likely to die next?",
                        style: context.styles.textImp,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
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
              IgnorePointer(
                ignoring: on,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const InkButton(amount: 460),
                    CommentButton(
                      amount: 24,
                      onPressed: () => DraggableMenu.open(
                        context,
                        const OpinionPageDraggable(openComment: true),
                        barrierColor: context.theme.current.barrierColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
