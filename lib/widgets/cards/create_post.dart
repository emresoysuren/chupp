import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/cards/app_card.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
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
          icon: FontAwesomeIcons.trash,
          color: context.theme.current.important,
          iconSize: 22,
          onTap: () => Navigator.pop<bool>(context, true),
        ),
        ListButton(
          title: Texts.createPostCardKeepButton,
          icon: FontAwesomeIcons.xmark,
          onTap: () => Navigator.pop<bool>(context, false),
        ),
      ],
    );
  }
}
