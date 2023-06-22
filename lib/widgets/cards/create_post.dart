import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/cards/app_card.dart';
import 'package:chupp/widgets/draggable_menu/draggable_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatePostCard extends StatelessWidget {
  const CreatePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: Texts.createPostCardTitle,
      description: Texts.createPostCardDS,
      children: [
        ListButton(
          title: Texts.createPostCardDiscardButton,
          icon: const FaIcon(FontAwesomeIcons.trash).icon,
          color: context.theme.current.important,
          iconSize: 22,
          onTap: () => Navigator.pop<bool>(context, true),
        ),
        ListButton(
          title: Texts.createPostCardKeepButton,
          icon: const FaIcon(FontAwesomeIcons.xmark).icon,
          onTap: () => Navigator.pop<bool>(context, false),
        ),
      ],
    );
  }
}
