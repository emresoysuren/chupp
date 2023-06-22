import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class HashtagChip extends StatelessWidget {
  final String tag;

  const HashtagChip({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: "#$tag",
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: context.theme.current.itemText,
      backgroundColor: context.theme.current.primaryItem,
      onPressed: () {},
    );
  }
}
