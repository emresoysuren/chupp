import 'package:chupp/widgets/posts/poll/poll_item.dart';
import 'package:flutter/material.dart';

class Poll extends StatelessWidget {
  final String tag1 = "character-1";
  final String tag2 = "character-2";
  final int vote1 = 3525;
  final int vote2 = 1921;
  final double gap;

  const Poll({
    super.key,
    this.gap = 16,
  });

  List<int> get votes {
    final list = [vote1, vote2];
    list.sort((a, b) => b.compareTo(a));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PollItem(tag: tag1, vote: votes[0]),
        SizedBox(height: gap),
        PollItem(tag: tag2, vote: votes[1], second: true),
      ],
    );
  }
}
