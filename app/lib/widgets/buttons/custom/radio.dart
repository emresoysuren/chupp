import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadioListButton extends ListButton {
  final bool? active;

  const RadioListButton({
    super.key,
    required super.title,
    super.color,
    super.onTap,
    this.active,
  });

  @override
  IconData? get icon => active == true
      ? FontAwesomeIcons.solidCircleDot
      : FontAwesomeIcons.solidCircle;
}
