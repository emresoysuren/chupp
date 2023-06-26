import 'package:flutter/material.dart';

class PostInherited extends InheritedWidget {
  final double offset;
  final void Function(double value) changeOffset;
  final void Function(double value) animateOffset;

  const PostInherited({
    super.key,
    required this.offset,
    required this.changeOffset,
    required this.animateOffset,
    required Widget child,
  }) : super(child: child);

  static PostInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PostInherited>();
  }

  @override
  bool updateShouldNotify(PostInherited oldWidget) {
    return true;
  }
}
