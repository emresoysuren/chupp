import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;

  const ProgressBar({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: context.theme.current.secondaryBg,
      ),
      child: LayoutBuilder(
        builder: (context, c) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: context.theme.current.primaryItem,
            ),
            width: c.maxWidth * value,
          );
        },
      ),
    );
  }
}
