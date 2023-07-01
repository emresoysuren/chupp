import 'package:chupp/config/color_palette.dart';
import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class PollItem extends StatefulWidget {
  final String tag;
  final int vote;
  final bool reversed;
  final bool second;
  final bool minimize;

  const PollItem({
    super.key,
    required this.tag,
    required this.vote,
    this.reversed = false,
    this.second = false,
    this.minimize = false,
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

  EdgeInsets get _padding => widget.minimize
      ? const EdgeInsets.symmetric(vertical: 10, horizontal: 8)
      : const EdgeInsets.symmetric(vertical: 10, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: scale,
      duration: animationDuration,
      child: Material(
        color: context.theme.current.primaryBtn,
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
            style: context.styles.button,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
        Ink(
          decoration: BoxDecoration(
            gradient:
                widget.second ? ColorPalette.orangeRed : ColorPalette.bluePink,
          ),
          child: Padding(
            padding: _padding,
            child: Center(
              child: Text(
                AppManager.numFormat(widget.vote),
                maxLines: 1,
                style:
                    context.styles.button.copyWith(color: ColorPalette.white),
              ),
            ),
          ),
        ),
      ];
}
