import 'package:chupp/config/styles.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool? secondary;
  final Color? color;
  final Color? passiveColor;
  final Color? labelColor;
  final double? elevation;
  final Alignment? alignment;
  final TextStyle? labelStyle;

  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.secondary,
    this.color,
    this.passiveColor,
    this.labelColor,
    this.elevation,
    this.labelStyle,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(elevation),
        enableFeedback: false,
        backgroundColor: MaterialStatePropertyAll(
          secondary == true
              ? Colors.transparent
              : onPressed == null
                  // Default Passive Color will be added later
                  ? passiveColor ?? color ?? AppTheme.current.primaryItem
                  : color ?? AppTheme.current.primaryItem,
        ),
        alignment: alignment,
        shape: MaterialStatePropertyAll(
          secondary != true
              ? const StadiumBorder()
              : StadiumBorder(
                  side: BorderSide(
                    color: onPressed == null
                        // Default Passive Color will be added later
                        ? passiveColor ?? color ?? AppTheme.current.primaryItem
                        : color ?? AppTheme.current.primaryItem,
                    width: 2,
                  ),
                ),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
      ),
      child: Text(
        label,
        style: labelStyle ??
            (secondary != true ? Styles.itemTextImp : Styles.textImp),
      ),
    );
  }
}
