import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentButton extends StatelessWidget {
  final int? amount;
  final Function()? onPressed;

  const CommentButton({
    super.key,
    this.amount,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      icon: const FaIcon(FontAwesomeIcons.solidMessage).icon,
      iconSize: 16,
      label: AppManager.numFormat(amount),
      onPressed: onPressed ?? () {},
    );
  }
}
