import 'dart:math';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:flutter/material.dart';

class ScrollAnimatedBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController? controller;
  final GlobalKey? contentKey;
  final List<Widget>? end;
  final List<Widget>? start;
  final double? offset;
  final bool pop;
  final EdgeInsets? padding;
  final bool popXmark;
  final Widget? child;
  final Color? backgroundColor;
  final Color? popColor;
  final bool backgroundAnimation;
  final double? fixedLenght;

  const ScrollAnimatedBar({
    super.key,
    this.controller,
    this.contentKey,
    this.offset,
    this.pop = false,
    this.padding,
    this.popXmark = false,
    this.start,
    this.child,
    this.end,
    this.backgroundColor,
    this.popColor,
    this.backgroundAnimation = false,
    this.fixedLenght,
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
    final after = widget.fixedLenght != null ? 0 : contentHeight! - barHeight!;
    final value = postion - after;
    if (value > 0 && value < (widget.fixedLenght ?? barHeight!)) {
      return value / (widget.fixedLenght ?? barHeight!);
    } else if (value >= (widget.fixedLenght ?? barHeight!)) {
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
      backgroundColor: widget.backgroundAnimation
          ? widget.backgroundColor?.withOpacity(offset)
          : widget.backgroundColor,
      pop: widget.pop,
      popXmark: widget.popXmark,
      popColor: widget.popColor,
      padding: widget.padding,
      child: Row(
        children: [
          ...?widget.start,
          Expanded(
            child: ClipRect(
              child: AnimatedSlide(
                offset: Offset(0, 1 - offset),
                duration: Duration.zero,
                child: widget.child,
              ),
            ),
          ),
          ...?widget.end
        ],
      ),
    );
  }
}
