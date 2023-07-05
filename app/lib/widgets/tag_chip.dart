import 'package:chupp/pages/side/hashtag/hashtag.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class HashtagChip extends StatelessWidget {
  final String tag;
  final bool large;
  final void Function()? onTap;
  final Color? color;
  final Color? backgroundColor;

  const HashtagChip({
    super.key,
    required this.tag,
    this.large = false,
    this.onTap,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: "#$tag",
      textStyle: context.styles.button,
      padding: large
          ? const EdgeInsets.symmetric(vertical: 6, horizontal: 12)
          : const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: color ?? context.theme.current.primaryBtnText,
      backgroundColor: backgroundColor ?? context.theme.current.primaryBtn,
      onPressed: onTap ??
          () => Navigator.of(context, rootNavigator: true).push(
                BasicPageRoute(start: Start.right, child: const HashtagPage()),
              ),
    );
  }
}
