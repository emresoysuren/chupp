import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
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
      appBar: Bar(
        pop: true,
        children: [
          Text(
            title,
            style: context.styles.title2,
          ),
        ],
      ),
      body: DisableScrollBehavior(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
