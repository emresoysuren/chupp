import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/cards/app_card.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiscardChangesCard extends StatelessWidget {
  const DiscardChangesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: context.lang.current.discardChangesCardTitle,
      description: context.lang.current.discardChangesCardDescription,
      children: [
        ListButton(
          title: context.lang.current.discardChangesCardDiscard,
          icon: FontAwesomeIcons.trash,
          color: context.theme.current.important,
          iconSize: 22,
          onTap: () => Navigator.pop<bool>(context, true),
        ),
        ListButton(
          title: context.lang.current.discardChangesCardKeep,
          icon: FontAwesomeIcons.xmark,
          onTap: () => Navigator.pop<bool>(context, false),
        ),
      ],
    );
  }
}
