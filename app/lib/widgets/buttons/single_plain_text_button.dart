import 'package:chupp/utils/utils/context_extension.dart';
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
  final Color? backgroundColor;
  final double? gap;
  final double? iconSize;
  final ShapeBorder? customBorder;

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
    this.backgroundColor,
    this.gap,
    this.iconSize,
    this.customBorder,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      if (icon != null)
        Icon(
          icon,
          size: iconSize ?? 20,
          color: color ?? context.theme.current.primaryItem,
        ),
      if (icon != null) SizedBox(width: gap ?? 8),
      Text(
        label ?? "",
        textWidthBasis: TextWidthBasis.longestLine,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: (textStyle ?? context.styles.textImp)
            .copyWith(color: color ?? context.theme.current.primaryItem),
      ),
    ];
    return SingleButton(
      color: backgroundColor,
      padding: padding ?? const EdgeInsets.all(8),
      customBorder: customBorder ?? const StadiumBorder(),
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
