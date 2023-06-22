import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';

class AddHastagsChip extends StatelessWidget {
  final String tag;
  final Function()? onTap;

  const AddHastagsChip({super.key, required this.tag, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SinglePlainTextButton(
      label: "#$tag",
      textStyle: context.styles.textImp,
      color: context.theme.current.itemText,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      backgroundColor: context.theme.current.primaryItem,
      onPressed: onTap,
    );
  }
}
