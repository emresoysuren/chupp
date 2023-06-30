import 'package:chupp/utils/styles.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:chupp/utils/utils/inherited.dart';
import 'package:flutter/material.dart';

class UtilsScope extends StatefulWidget {
  final Widget child;

  const UtilsScope({
    super.key,
    required this.child,
  });

  @override
  State<UtilsScope> createState() => _UtilsScopeState();
}

class _UtilsScopeState extends State<UtilsScope> {
  @override
  void initState() {
    _themeInit();
    super.initState();
  }

  void _themeInit() {
    AppTheme.instance.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return UtilsInherited(
      theme: AppTheme.instance,
      styles: Styles(theme: AppTheme.instance),
      child: widget.child,
    );
  }
}
