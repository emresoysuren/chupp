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
  final bool oneWay;

  const ExpandableText(
    this.text, {
    super.key,
    this.style,
    this.active = true,
    this.onTap,
    this.expanded = false,
    this.characterThresold,
    this.oneWay = false,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool expanded = widget.expanded;

  int get maxCharacters => widget.characterThresold ?? 100;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 120),
      alignment: Alignment.topLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap ??
            (!widget.active
                ? null
                : () => setState(() =>
                    expanded = widget.oneWay ? !widget.expanded : !expanded)),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: expanded
                    ? widget.text
                    : widget.text
                        .substring(0, min(widget.text.length, maxCharacters)),
                style: widget.style ?? context.styles.text,
              ),
              if (!expanded)
                TextSpan(
                  text: " ${Texts.expandableTextMore}",
                  style: context.styles.subText,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
