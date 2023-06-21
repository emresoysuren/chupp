import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';

class SinglePlainTextButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  final Color? color;
  final IconData? icon;
  final bool? reversed;
  final EdgeInsetsGeometry? padding;

  /// Color of the text styles will be overridden
  final TextStyle? textStyle;
  final Alignment? alignment;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? gap;

  const SinglePlainTextButton({
    super.key,
    this.label,
    this.onPressed,
    this.color,
    this.icon,
    this.reversed,
    this.padding,
    this.textStyle,
    this.alignment,
    this.borderRadius,
    this.backgroundColor,
    this.gap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      if (icon != null)
        Icon(
          icon,
          size: 20,
          color: color ?? Utils.theme.current.primaryItem,
        ),
      if (icon != null) SizedBox(width: gap ?? 8),
      Text(
        label ?? "",
        textWidthBasis: TextWidthBasis.longestLine,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: (textStyle ?? Styles.textImp)
            .copyWith(color: color ?? Utils.theme.current.primaryItem),
      ),
    ];
    return SingleButton(
      color: backgroundColor,
      padding: padding ?? const EdgeInsets.all(8),
      customBorder: const StadiumBorder(),
      onPressed: onPressed,
      child: Align(
        heightFactor: 1,
        widthFactor: 1,
        alignment: alignment ?? Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: reversed == true ? children.reversed.toList() : children,
        ),
      ),
    );
  }
}
