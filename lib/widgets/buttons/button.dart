import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsets? padding;
  final Function()? onPressed;
  final bool large;

  const Button({
    super.key,
    required this.label,
    this.backgroundColor,
    this.color,
    this.padding,
    this.onPressed,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: label,
      backgroundColor: backgroundColor ?? context.theme.current.primaryItem,
      color: color ?? context.theme.current.itemText,
      padding: padding ??
          EdgeInsets.symmetric(horizontal: 16, vertical: large ? 16 : 8),
      onPressed: onPressed,
    );
  }
}
