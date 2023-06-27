import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:flutter/material.dart';

class TitleBar extends Bar {
  final String title;
  final List<Widget>? items;

  const TitleBar({
    super.key,
    required this.title,
    this.items,
    super.pop,
    super.popXmark,
  });

  @override
  bool get center => false;

  @override
  Widget get child => Builder(
        builder: (context) {
          return Row(
            children: [
              Text(
                title,
                style: context.styles.title2,
              ),
              const Spacer(),
              ...?items
            ],
          );
        },
      );
}
