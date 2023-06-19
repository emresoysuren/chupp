import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';

class AppUtils extends StatefulWidget {
  const AppUtils({super.key});

  @override
  State<AppUtils> createState() => _AppUtilsState();
}

class _AppUtilsState extends State<AppUtils> {
  @override
  void initState() {
    AppTheme().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
