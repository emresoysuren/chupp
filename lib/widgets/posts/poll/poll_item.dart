import 'package:chupp/config/styles.dart';
import 'package:chupp/config/utils.dart';
import 'package:flutter/material.dart';

class PollItem extends StatefulWidget {
  final String tag;
  final int vote;
  final bool reversed;

  const PollItem({
    super.key,
    required this.tag,
    required this.vote,
    this.reversed = false,
  });

  @override
  State<PollItem> createState() => _PollItemState();
}

class _PollItemState extends State<PollItem> {
  double scale = 1;

  Future<void> _animate() async {
    setState(() => scale = 0.96);
    await Future.delayed(animationDuration);
    setState(() => scale = 1);
  }

  get animationDuration => const Duration(milliseconds: 120);

  EdgeInsets get _padding => const EdgeInsets.all(8);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      duration: animationDuration,
      child: Material(
        color: Utils.theme.current.primaryItem,
        clipBehavior: Clip.hardEdge,
        shape: const StadiumBorder(),
        child: InkWell(
          enableFeedback: false,
          customBorder: const StadiumBorder(),
          onTap: () {
            _animate();
            // Keep the _animate method on the top
          },
          child: Ink(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    widget.reversed ? _content.reversed.toList() : _content,
              ),
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
            "#${widget.tag}",
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
                widget.vote.toString(),
                maxLines: 1,
                style: Styles.textImp,
              ),
            ),
          ),
        ),
      ];
}
