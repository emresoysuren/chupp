import 'dart:math';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:flutter/material.dart';

class ScrollAnimatedBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController? controller;
  final GlobalKey? contentKey;
  final String? title;
  final List<Widget>? bottom;
  final List<Widget>? aside;
  final double? offset;

  const ScrollAnimatedBar({
    super.key,
    this.controller,
    this.contentKey,
    this.title,
    this.bottom,
    this.aside,
    this.offset,
  });

  @override
  State<ScrollAnimatedBar> createState() => _ScrollAnimatedBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _ScrollAnimatedBarState extends State<ScrollAnimatedBar> {
  // final GlobalKey _barKey = GlobalKey();
  double? contentHeight;
  double? barHeight;

  @override
  void initState() {
    widget.controller?.addListener(() => setState(() {
          contentHeight = widget.contentKey?.currentContext?.size?.height;
          // barHeight ??= _barKey.currentContext?.size?.height;
          barHeight = 64;
        }));
    super.initState();
  }

  double get _controllerOffsetValue {
    if (widget.controller?.hasClients != true ||
        contentHeight == null ||
        barHeight == null) {
      return 0;
    }
    final postion = widget.controller!.position.pixels;
    final value = postion - (contentHeight! - barHeight!);
    if (value > 0 && value < barHeight!) {
      return value / barHeight!;
    } else if (value >= barHeight!) {
      return 1;
    } else {
      return 0;
    }
  }

  double get offset => widget.offset == null
      ? _controllerOffsetValue
      : max<double>(widget.offset!, _controllerOffsetValue);

  @override
  Widget build(BuildContext context) {
    return Bar(
        // key: _barKey,
        pop: true,
        child: Row(
          children: [
            Expanded(
              child: ClipRect(
                child: AnimatedSlide(
                  offset: Offset(0, 1 - offset),
                  duration: Duration.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.title != null)
                        Text(
                          widget.title!,
                          style: context.styles.title3,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                        ),
                      if (widget.bottom != null) const SizedBox(height: 4),
                      if (widget.bottom != null) Row(children: widget.bottom!),
                    ],
                  ),
                ),
              ),
            ),
            ...?widget.aside
          ],
        ));
  }
}
