import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? color;
  final EdgeInsets? padding;
  final bool secondary;
  final Function()? onPressed;
  final bool large;
  final IconData? icon;
  final double? iconSize;
  final double? gap;

  const Button({
    super.key,
    required this.label,
    this.backgroundColor,
    this.color,
    this.padding,
    this.onPressed,
    this.large = false,
    this.secondary = false,
    this.icon,
    this.iconSize,
    this.gap,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: label,
      icon: icon,
      iconSize: iconSize,
      gap: gap,
      customBorder: !secondary
          ? null
          : StadiumBorder(
              side: BorderSide(
                width: 2,
                color: context.theme.current.primaryItem,
              ),
            ),
      backgroundColor: secondary
          ? Colors.transparent
          : (backgroundColor ?? context.theme.current.primaryItem),
      color: color ??
          (secondary
              ? context.theme.current.primaryItem
              : context.theme.current.itemText),
      padding: padding ??
          EdgeInsets.symmetric(horizontal: 16, vertical: large ? 16 : 8),
      onPressed: onPressed,
    );
  }
}
