import 'package:chupp/app.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await AppTheme.instance.init();
  runApp(App());
}
