import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class SeeMorePage extends StatelessWidget {
  final String title;

  final int? itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  const SeeMorePage({
    super.key,
    required this.title,
    required this.itemBuilder,
    this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: TitleBar(title: title, pop: true),
      body: DisableScrollBehavior(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
