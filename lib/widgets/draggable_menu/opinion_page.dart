import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/posts/comment/comment.dart';
import 'package:chupp/widgets/posts/opinion/opinion_widget.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class OpinionPageDraggable extends StatefulWidget {
  const OpinionPageDraggable({super.key});

  @override
  State<OpinionPageDraggable> createState() => _OpinionPageDraggableState();
}

class _OpinionPageDraggableState extends State<OpinionPageDraggable> {
  final DraggableMenuController _controller = DraggableMenuController();

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      controller: _controller,
      ui: ClassicDraggableMenu(
        color: context.theme.current.secondaryBg,
      ),
      levels: [
        DraggableMenuLevel.ratio(ratio: 0.4),
        DraggableMenuLevel.ratio(ratio: 1),
      ],
      child: ScrollableManager(
        enableExpandedScroll: true,
        child: DisableScrollBehavior(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: OpinionWidget(
                    draggableMenuController: _controller,
                  ),
                ),
                // Comments - START
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          Texts.opinionCommentsTitle,
                          style: context.styles.title3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      for (int i = 0; i < 6; i++) const CommentWidget(),
                    ],
                  ),
                ),
                // Comments - END
              ],
            ),
          ),
        ),
      ),
    );
  }
}
