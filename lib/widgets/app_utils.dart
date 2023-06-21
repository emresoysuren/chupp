import 'package:chupp/config/utils.dart';
import 'package:flutter/material.dart';

class AppUtils extends StatefulWidget {
  final Widget child;

  const AppUtils({super.key, required this.child});

  @override
  State<AppUtils> createState() => _AppUtilsState();
}

class _AppUtilsState extends State<AppUtils> {
  @override
  void initState() {
    _themeInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _themeInit() {
    Utils.theme.addListener(() {
      setState(() {});
    });
    Utils.theme.init();
  }
}
