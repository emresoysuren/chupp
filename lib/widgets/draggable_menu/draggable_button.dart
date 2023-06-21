import 'package:chupp/config/styles.dart';
import 'package:flutter/material.dart';

class DraggableButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final IconData? icon;
  final Color? color;
  final double? iconSize;

  const DraggableButton({
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
        style: Styles.textImp.copyWith(color: color),
      ),
      leading: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}
