import 'package:chupp/utils/router/app_router.dart';
import 'package:chupp/utils/utils/scope.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return UtilsScope(
      child: MaterialApp.router(
        title: "chupp",
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
