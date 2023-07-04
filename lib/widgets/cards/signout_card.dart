import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:chupp/widgets/cards/app_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignOutCard extends StatelessWidget {
  const SignOutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: context.lang.current.signOut,
      description: context.lang.current.signOutDialogue,
      children: [
        ListButton(
          title: context.lang.current.signOutCardContinue,
          icon: FontAwesomeIcons.check,
          onTap: () => Navigator.pop<bool>(context, true),
        ),
        ListButton(
          title: context.lang.current.signOutCardCancel,
          icon: FontAwesomeIcons.xmark,
          color: context.theme.current.important,
          onTap: () => Navigator.pop<bool>(context, false),
        ),
      ],
    );
  }
}
