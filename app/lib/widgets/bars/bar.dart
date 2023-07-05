import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/pop_button.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final bool pop;
  final bool popXmark;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? popColor;

  const Bar({
    super.key,
    this.child,
    this.pop = false,
    this.popXmark = false,
    this.padding,
    this.backgroundColor,
    this.popColor,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? context.theme.current.primaryBg,
      child: SafeArea(
        child: Padding(
          padding: padding ??
              (pop == true
                  ? const EdgeInsets.only(left: 8, right: 16)
                  : const EdgeInsets.symmetric(horizontal: 16)),
          child: Center(
            child: Row(
              children: [
                if (pop)
                  PopButton(
                    xmark: popXmark,
                    color: popColor,
                  ),
                if (child != null) Expanded(child: child!),
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
