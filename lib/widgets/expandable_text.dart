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
  late bool expand = widget.expanded;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => expand = !expand),
      child: Text(
        widget.text,
        style: widget.style ?? Styles.text,
        maxLines: expand ? null : 3,
      ),
    );
  }
}
