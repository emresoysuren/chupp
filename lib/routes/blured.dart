import 'dart:ui';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class BluredRoute<T> extends PageRouteBuilder<T> {
  final double? blur;

  BluredRoute(
    BuildContext context, {
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
          barrierColor: barrierColor ?? context.theme.current.barrierColor,
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
