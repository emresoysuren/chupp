import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData? icon;
  final Color? color;
  final double? iconSize;

  const ListButton({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.color,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      title: Text(
        title,
        style: context.styles.textImp
            .copyWith(color: color ?? context.theme.current.primaryItem),
      ),
      leading: icon == null
          ? null
          : Icon(
              icon,
              color: color ?? context.theme.current.primaryItem,
              size: iconSize,
            ),
    );
  }
}
