import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/posts/content_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OpinionDraggable extends StatelessWidget {
  const OpinionDraggable({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      levels: [
        DraggableMenuLevel.ratio(ratio: 0.4),
        DraggableMenuLevel.ratio(ratio: 1),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentHeader(
                username: "username",
                time: "5/30/14 19:26",
                option: "#option",
                children: [
                  SingleButton(
                    onPressed: () {},
                    child: FaIcon(
                      FontAwesomeIcons.ellipsis,
                      color: context.theme.current.primaryItem,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                style: context.styles.text,
              ),
              const SizedBox(height: 4),
              SinglePlainTextButton(
                icon: const FaIcon(FontAwesomeIcons.droplet).icon,
                iconSize: 16,
                label: "4.6k",
                gap: 4,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
