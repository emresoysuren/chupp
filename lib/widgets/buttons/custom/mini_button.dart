import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class MiniButton extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsets? padding;
  final Function()? onPressed;

  const MiniButton({
    super.key,
    required this.label,
    this.backgroundColor,
    this.color,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: label,
      backgroundColor: backgroundColor ?? context.theme.current.primaryItem,
      color: color ?? context.theme.current.itemText,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onPressed: onPressed,
    );
  }
}
