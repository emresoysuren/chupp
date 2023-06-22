import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:chupp/widgets/draggable_menu/post_menu.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController? controller;
  final GlobalKey? contentKey;

  const ContentBar({
    super.key,
    this.controller,
    this.contentKey,
  });

  @override
  State<ContentBar> createState() => _ContentBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _ContentBarState extends State<ContentBar> {
  // final GlobalKey _barKey = GlobalKey();
  double? contentHeight;
  double? barHeight;

  @override
  void initState() {
    widget.controller?.addListener(() => setState(() {
          contentHeight = widget.contentKey?.currentContext?.size?.height;
          // barHeight ??= _barKey.currentContext?.size?.height;
          barHeight = 64;
        }));
    super.initState();
  }

  double get offsetValue {
    if (widget.controller?.hasClients != true ||
        contentHeight == null ||
        barHeight == null) {
      return 0;
    }
    final postion = widget.controller!.position.pixels;
    final value = postion - (contentHeight! - barHeight!);
    if (value > 0 && value < barHeight!) {
      return value / barHeight!;
    } else if (value >= barHeight!) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Bar(
      // key: _barKey,
      pop: true,
      children: [
        Expanded(
          child: ClipRect(
            child: AnimatedSlide(
              offset: Offset(0, 1 - offsetValue),
              duration: Duration.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Which character is more likely to die next?",
                    style: context.styles.title3,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.droplet,
                        color: context.theme.current.text,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "4.6k",
                        style: context.styles.text,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "5/30/14 19:26",
                        style: context.styles.subText,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SingleButton(
          onPressed: () => DraggableMenu.open(
            context,
            const PostMenu(),
          ),
          child: FaIcon(
            FontAwesomeIcons.ellipsis,
            color: context.theme.current.primaryItem,
          ),
        )
      ],
    );
  }
}
