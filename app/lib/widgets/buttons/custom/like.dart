import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButton extends StatelessWidget {
  final int? amount;
  final Function()? onPressed;

  const LikeButton({
    super.key,
    this.amount,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      icon: const FaIcon(FontAwesomeIcons.solidHeart).icon,
      iconSize: 18,
      label: AppManager.numFormat(amount),
      gap: 4,
      onPressed: onPressed ?? () {},
    );
  }
}
