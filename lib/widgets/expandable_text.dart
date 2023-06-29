import 'dart:math';
import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final bool expanded;
  final bool active;
  final Function()? onTap;
  final int? characterThresold;
  final bool reuseable;

  const ExpandableText(
    this.text, {
    super.key,
    this.style,
    this.active = true,
    this.onTap,
    this.expanded = false,
    this.characterThresold,
    this.reuseable = false,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool expanded = widget.expanded;

  int get maxCharacters => widget.characterThresold ?? 100;

  bool get _minimized => !expanded && _enoughLenght;

  bool get _enoughLenght => widget.text.length > maxCharacters;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 120),
      alignment: Alignment.topLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap ??
            ((!widget.active ||
                    (!widget.reuseable && expanded == !widget.expanded) ||
                    !_enoughLenght)
                ? null
                : () => setState(() => expanded = !expanded)),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: _minimized
                    ? widget.text
                        .substring(0, min(widget.text.length, maxCharacters))
                    : widget.text,
                style: widget.style ?? context.styles.text,
              ),
              if (_minimized)
                TextSpan(
                  text: " ${Texts.expandableTextMore}",
                  style: context.styles.mutted,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
