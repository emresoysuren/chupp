import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';

class PopButton extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final double? size;
  final Color? backgroundColor;
  final double? padding;

  const PopButton({
    super.key,
    this.color,
    this.icon,
    this.size,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SingleButton(
      color: backgroundColor,
      onPressed: () => Navigator.of(context).pop(),
      padding: padding != null ? EdgeInsets.all(padding!) : null,
      child: Icon(
        icon ?? Icons.arrow_back_ios_new_rounded,
        size: size ?? 20,
        color: color ?? AppTheme.current.primaryItem,
      ),
    );
  }
}
