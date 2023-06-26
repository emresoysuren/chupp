import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/post/post_inherited.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/posts/comment/comment.dart';
import 'package:chupp/widgets/posts/functional/add_comment.dart';
import 'package:chupp/widgets/posts/opinion/opinion_widget.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class OpinionPageDraggable extends StatefulWidget {
  final bool openComment;

  const OpinionPageDraggable({
    super.key,
    this.openComment = false,
  });

  @override
  State<OpinionPageDraggable> createState() => _OpinionPageDraggableState();
}

class _OpinionPageDraggableState extends State<OpinionPageDraggable> {
  final DraggableMenuController _controller = DraggableMenuController();
  bool _closing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return DraggableMenu(
        controller: _controller,
        ui: ClassicDraggableMenu(
          color: context.theme.current.secondaryBg,
        ),
        levels: [
          // DO NOT DELETE ANY LEVEL
          // IT WILL THROW AN EXCEPTION IF IT CAN'T ANIMATE TO LEVEL 1
          DraggableMenuLevel(height: c.maxHeight * 0.5),
          DraggableMenuLevel(height: c.maxHeight),
        ],
        addValueListener: (menuValue, raw, levelValue) {
          if (!_closing) {
            PostInherited.of(context)?.changeOffset(menuValue);
          }
        },
        addStatusListener: (status, level) {
          if (status == DraggableMenuStatus.closing) {
            _closing = true;
            PostInherited.of(context)?.changeOffset(0);
          }
        },
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Expanded(
                child: ScrollableManager(
                  enableExpandedScroll: true,
                  child: DisableScrollBehavior(
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
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
                                for (int i = 0; i < 6; i++)
                                  const CommentWidget(),
                              ],
                            ),
                          ),
                          // Comments - END
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: context.theme.current.secondaryItem,
                    ),
                  ),
                ),
                child: AddComment(
                  backgroundColor: context.theme.current.secondaryBg,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
