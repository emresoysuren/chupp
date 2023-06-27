import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/see_more.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final double gap;
  final EdgeInsets? padding;
  final bool bottomLine;

  /// You can use this parameter to override the `itemCount` parameter but only for the see more page.
  final int? seeMoreItemCount;

  /// You can use this parameter to override the `itemBuilder` parameter but only for the see more page.
  final Widget Function(BuildContext context, int index)? seeMoreItemBuilder;

  const Section({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    this.gap = 16,
    this.padding,
    this.bottomLine = true,
    this.seeMoreItemCount,
    this.seeMoreItemBuilder,
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
            for (int i = 0; i < itemCount; i++) itemBuilder.call(context, i),
            ListButton(
              title: Texts.sectionSeeMore,
              color: context.theme.current.notice,
              onTap: () => Navigator.push(
                context,
                BasicPageRoute(
                  start: Start.right,
                  child: SeeMorePage(
                    title: title,
                    itemCount: seeMoreItemCount ?? itemCount,
                    itemBuilder: seeMoreItemBuilder ?? itemBuilder,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
