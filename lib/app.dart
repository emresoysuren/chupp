import 'package:chupp/pages/func/splash.dart';
import 'package:chupp/widgets/app_utils.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppUtils(
      child: MaterialApp(
        title: "chupp",
        home: SplashPage(),
      ),
    );
  }
}
