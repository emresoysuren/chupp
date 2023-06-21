import 'package:chupp/widgets/posts/poll/poll_item.dart';
import 'package:flutter/material.dart';

class Poll extends StatelessWidget {
  final String tag1 = "character-1";
  final String tag2 = "character-2";
  final int vote1 = 352;
  final int vote2 = 192;

  const Poll({super.key});

  double get gap => 16;

  @override
  Widget build(BuildContext context) {
    if (tag1.length > 10 || tag2.length > 10) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PollItem(tag: tag1, vote: vote1),
          SizedBox(height: gap),
          PollItem(tag: tag2, vote: vote2),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: gap / 2),
              child: IntrinsicWidth(
                child: PollItem(tag: tag1, vote: vote1),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: gap / 2),
              child: IntrinsicWidth(
                child: PollItem(tag: tag2, vote: vote2, reversed: true),
              ),
            ),
          ),
        ],
      );
    }
  }
}
