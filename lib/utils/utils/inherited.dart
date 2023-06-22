import 'package:chupp/utils/styles.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';

class UtilsInherited extends InheritedWidget {
  const UtilsInherited({
    super.key,
    required Widget child,
    required this.theme,
    required this.styles,
  }) : super(child: child);

  final AppTheme theme;
  final Styles styles;

  static UtilsInherited of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<UtilsInherited>();
    assert(result != null);
    return result!;
  }

  @override
  bool updateShouldNotify(UtilsInherited oldWidget) {
    return true;
  }
}
