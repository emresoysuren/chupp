import 'package:auto_route/auto_route.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  final Function(bool result)? onLogin;

  const AuthPage({super.key, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Button(label: "Log In or Sign Up"),
            const SizedBox(height: 16),
            Button(
              label: "Continue without Loging In",
              onPressed: () => signInAnonymously(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInAnonymously(BuildContext context) async {
    await UiManager.animateAndLoad(
      context,
      () => DataService.signInAnonymously(),
    );
    onLogin?.call(true);
  }
}
