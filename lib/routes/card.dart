import 'package:flutter/material.dart';

class CardRoute<T> extends PageRouteBuilder<T> {
  CardRoute({
    Color? barrierColor,
    Duration? duration,
    required Widget child,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          barrierColor: barrierColor ?? const Color(0x80000000),
          opaque: false,
          barrierDismissible: true,
          transitionDuration: duration ?? Duration.zero,
          reverseTransitionDuration: duration ?? Duration.zero,
        );
}
