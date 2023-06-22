import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
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
        style: Styles.textImp
            .copyWith(color: color ?? Utils.theme.current.primaryItem),
      ),
      leading: Icon(
        icon,
        color: color ?? Utils.theme.current.primaryItem,
        size: iconSize,
      ),
    );
  }
}
