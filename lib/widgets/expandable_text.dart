import 'dart:math';

import 'package:chupp/config/styles.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final bool expanded = false;

  const ExpandableText(
    this.text, {
    super.key,
    this.style,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool expanded = widget.expanded;

  int get maxCharacters => 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => expanded = !expanded),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: expanded
                  ? widget.text
                  : widget.text
                      .substring(0, min(widget.text.length, maxCharacters)),
              style: widget.style ?? Styles.text,
            ),
            if (!expanded) TextSpan(text: " See More", style: Styles.subText),
          ],
        ),
      ),
    );
  }
}
