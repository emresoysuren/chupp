import 'package:flutter/material.dart';

class NonAnimatedPageRoute extends PageRouteBuilder {
  NonAnimatedPageRoute({
    required Widget child,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          barrierDismissible: false,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        );
}
