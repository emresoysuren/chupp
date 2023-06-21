import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:chupp/widgets/draggable_menu/post_menu.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentBar extends Bar {
  const ContentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Bar(
      pop: true,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Which character is more likely to die next?",
                style: Styles.title3,
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.droplet,
                    color: Utils.theme.current.text,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "4.6k",
                    style: Styles.text,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "5/30/14 19:26",
                    style: Styles.subText,
                  ),
                ],
              ),
            ],
          ),
        ),
        SingleButton(
          onPressed: () => DraggableMenu.open(
            context,
            const PostMenu(),
          ),
          child: FaIcon(
            FontAwesomeIcons.ellipsis,
            color: Utils.theme.current.primaryItem,
          ),
        )
      ],
    );
  }
}
