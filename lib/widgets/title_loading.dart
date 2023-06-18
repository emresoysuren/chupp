import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TitleLoading extends StatefulWidget {
  final String title;
  final TextStyle style;

  const TitleLoading({super.key, required this.title, required this.style});

  @override
  State<TitleLoading> createState() => _TitleLoadingState();
}

class _TitleLoadingState extends State<TitleLoading>
    with TickerProviderStateMixin {
  late Ticker _ticker;
  List<Widget> letters = [];

  @override
  void initState() {
    final List<String> titleLetters = widget.title.split("");
    _ticker = createTicker((elapsed) {
      final angle =
          pi * elapsed.inMicroseconds / Duration.microsecondsPerSecond;
      List<Widget> cache = [];
      for (int n = 0; n < titleLetters.length; n++) {
        String letter = titleLetters[n];
        var diff = sin((n * (pi / 6)) + (angle)) * 8;
        Widget letterWidget = Padding(
          padding: EdgeInsets.only(
            top: 32 - diff,
            bottom: 32 + diff,
          ),
          child: Text(
            letter,
            style: widget.style,
          ),
        );
        cache.add(letterWidget);
      }
      setState(() {
        letters = cache;
      });
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: letters,
    );
  }
}
