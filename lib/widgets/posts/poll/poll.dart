import 'package:chupp/widgets/posts/poll/poll_item.dart';
import 'package:flutter/material.dart';

class Poll extends StatelessWidget {
  final String tag1 = "character-1";
  final String tag2 = "character-2";
  final int vote1 = 352;
  final int vote2 = 192;
  final double gap;

  const Poll({
    super.key,
    this.gap = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PollItem(tag: tag1, vote: vote1),
        SizedBox(height: gap),
        PollItem(tag: tag2, vote: vote2, second: true),
      ],
    );
  }
}
