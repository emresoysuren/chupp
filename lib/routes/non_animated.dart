import 'package:flutter/material.dart';

class NonAnimatedPageRoute<T> extends PageRouteBuilder<T> {
  NonAnimatedPageRoute({
    required Widget child,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          barrierDismissible: false,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
