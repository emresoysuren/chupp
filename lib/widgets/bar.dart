import 'package:chupp/config/utils.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? children;
  final bool? center;

  const Bar({super.key, this.children, this.center});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Utils.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              mainAxisAlignment: center == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: children ?? [],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
