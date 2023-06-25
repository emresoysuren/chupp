import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/draggable_menu/opinion_page.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:chupp/widgets/posts/content_widgets/content_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniOpinion extends StatelessWidget {
  const MiniOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        onTap: () => DraggableMenu.open(context, const OpinionPageDraggable()),
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
