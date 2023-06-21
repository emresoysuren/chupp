import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:flutter/material.dart';

class PollItem extends StatelessWidget {
  final String tag;
  final int vote;
  final bool reversed;

  const PollItem({
    super.key,
    required this.tag,
    required this.vote,
    this.reversed = false,
  });

  EdgeInsets get _padding => const EdgeInsets.all(8);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Utils.theme.current.primaryItem,
      clipBehavior: Clip.hardEdge,
      shape: const StadiumBorder(),
      child: InkWell(
        enableFeedback: false,
        customBorder: const StadiumBorder(),
        onTap: () {},
        child: Ink(
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: reversed ? _content.reversed.toList() : _content,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get _content => <Widget>[
        Padding(
          padding: _padding,
          child: Text(
            "#$tag",
            style: Styles.itemTextImp,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
        ColoredBox(
          color: Utils.theme.current.appTitle,
          child: Padding(
            padding: _padding,
            child: Center(
              child: Text(
                vote.toString(),
                maxLines: 1,
                style: Styles.textImp,
              ),
            ),
          ),
        ),
      ];
}
