import 'package:flutter/material.dart';

class BasicPageRoute<T> extends PageRouteBuilder<T> {
  final Start start;
  BasicPageRoute({
    required this.start,
    required Widget child,
    Duration? duration,
    Color? barrierColor,
    bool? barrierDismissible,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration ?? const Duration(milliseconds: 320),
          reverseTransitionDuration:
              duration ?? const Duration(milliseconds: 320),
          opaque: false,
          barrierDismissible: barrierDismissible ?? false,
          barrierColor: barrierColor,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: start == Start.left
                  ? const Offset(-1, 0)
                  : start == Start.top
                      ? const Offset(0, -1)
                      : start == Start.right
                          ? const Offset(1, 0)
                          : start == Start.bottom
                              ? const Offset(0, 1)
                              : const Offset(-1, 0),
              end: const Offset(0, 0))
          .animate(
        animation.drive(
          CurveTween(curve: Curves.ease),
        ),
      ),
      child: child,
    );
  }
}

enum Start {
  left,
  top,
  right,
  bottom,
}
