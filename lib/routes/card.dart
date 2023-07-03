import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class CardRoute<T> extends PageRouteBuilder<T> {
  CardRoute(
    BuildContext context, {
    Color? barrierColor,
    Duration? duration,
    required Widget child,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          barrierColor: barrierColor ?? context.theme.current.barrierColor,
          opaque: false,
          barrierDismissible: true,
          transitionDuration: duration ?? Duration.zero,
          reverseTransitionDuration: duration ?? Duration.zero,
        );
}
