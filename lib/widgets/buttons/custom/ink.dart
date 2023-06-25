import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InkButton extends StatelessWidget {
  final int? amount;
  final Function()? onPressed;

  const InkButton({
    super.key,
    this.amount,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      icon: const FaIcon(FontAwesomeIcons.droplet).icon,
      iconSize: 16,
      gap: 4,
      label: (amount ?? "Vote").toString(),
      onPressed: onPressed ?? () {},
    );
  }
}
