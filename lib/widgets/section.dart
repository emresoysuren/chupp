import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final int? itemCount;
  final Widget Function(BuildContext context, int index)? builder;
  final double gap;
  final EdgeInsets? padding;
  final bool bottomLine;

  const Section({
    super.key,
    required this.title,
    this.itemCount,
    this.builder,
    this.gap = 16,
    this.padding,
    this.bottomLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: !bottomLine
              ? BorderSide.none
              : BorderSide(
                  width: 1,
                  color: context.theme.current.secondaryBg,
                ),
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                title,
                style: context.styles.title2,
              ),
            ),
            SizedBox(height: gap),
            if (itemCount != null && builder != null)
              for (int i = 0; i < itemCount!; i++) builder!.call(context, i),
            ListButton(
              title: Texts.sectionSeeMore,
              color: context.theme.current.notice,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
