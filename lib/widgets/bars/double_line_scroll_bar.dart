import 'package:chupp/widgets/bars/scroll_animated_bar.dart';
import 'package:flutter/material.dart';

class DoubleLineScrollBar extends ScrollAnimatedBar {
  final Widget? bottom;
  final Widget? top;

  const DoubleLineScrollBar({
    super.key,
    this.top,
    this.bottom,
    super.contentKey,
    super.controller,
    super.end,
    super.offset,
    super.pop,
    super.popXmark,
    super.padding,
    super.start,
  });

  @override
  Widget get child => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (top != null) top!,
          if (top != null && bottom != null) const SizedBox(height: 4),
          if (bottom != null) bottom!,
        ],
      );
}
