import 'dart:ui';
import 'package:flutter/material.dart';

class BluredRoute<T> extends PageRouteBuilder<T> {
  final double? blur;

  BluredRoute({
    required Widget child,
    this.blur,
    Color? barrierColor,
    Duration? duration,
    bool? barrierDismissible,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration ?? const Duration(milliseconds: 480),
          reverseTransitionDuration:
              duration ?? const Duration(milliseconds: 480),
          opaque: false,
          barrierDismissible: barrierDismissible ?? true,
          barrierColor: barrierColor ?? const Color(0x80000000),
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final double value = animation
        .drive(
          CurveTween(curve: Curves.ease),
        )
        .value;
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: (blur ?? 16) * value,
        sigmaY: (blur ?? 16) * value,
      ),
      child: child,
    );
  }
}
