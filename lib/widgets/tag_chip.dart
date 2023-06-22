import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class HashtagChip extends StatelessWidget {
  final String tag;
  final bool large;

  const HashtagChip({
    super.key,
    required this.tag,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: "#$tag",
      textStyle: context.styles.textImp,
      padding: large
          ? const EdgeInsets.symmetric(vertical: 6, horizontal: 12)
          : const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: context.theme.current.itemText,
      backgroundColor: context.theme.current.primaryItem,
      onPressed: () {},
    );
  }
}
