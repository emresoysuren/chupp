import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/buttons/pop_button.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? children;
  final bool? center;
  final bool? pop;

  const Bar({
    super.key,
    this.children,
    this.center,
    this.pop,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Utils.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: pop == true
              ? const EdgeInsets.only(left: 8, right: 16)
              : const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: center == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                if (pop == true) const PopButton(),
                if (children != null) ...children!,
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
