import 'package:flutter/material.dart';

class PostInherited extends InheritedWidget {
  final double offset;
  final Function(double value) changeOffset;

  const PostInherited({
    super.key,
    required this.offset,
    required this.changeOffset,
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
