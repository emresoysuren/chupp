import 'package:auto_route/auto_route.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/extensions.dart';
import 'package:chupp/utils/ui_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/auth/field.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  final Function(bool result)? onLogin;

  const AuthPage({super.key, this.onLogin});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String password = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login to",
                        style: context.styles.title,
                      ),
                      const SizedBox(
                        height: 48,
                        width: 116,
                        child: RiveAnimation.asset(
                          "assets/rive/chupp-title/blue.riv",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                AuthField(
                  label: "Email",
                  onChanged: (value) => setState(() => email = value),
                ),
                const SizedBox(height: 16),
                AuthField(
                  label: "Password",
                  password: true,
                  onChanged: (value) => setState(() => password = value),
                ),
                const SizedBox(height: 16),
                const Button(
                  large: true,
                  label: "Login",
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: Button(
                        large: true,
                        secondary: true,
                        label: "Google",
                        icon: FontAwesomeIcons.google,
                        iconSize: 18,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Button(
                        large: true,
                        secondary: true,
                        label: "Apple",
                        icon: FontAwesomeIcons.apple,
                        iconSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Center(
                  child: SinglePlainTextButton(
                    label: "Do you need help?",
                  ),
                )
              ],
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                color: context.theme.current.secondaryBg,
                height: 1,
                width: double.infinity,
              ),
              ColoredBox(
                color: context.theme.current.primaryBg,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "or",
                    style: context.styles.title3
                        .copyWith(color: context.theme.current.subText),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Button(
                  large: true,
                  secondary: true,
                  label: "Register",
                ),
                const SizedBox(height: 16),
                Button(
                  large: true,
                  secondary: true,
                  label: "Continue without Loging In",
                  onPressed: () => signInAnonymously(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> signInAnonymously(BuildContext context) async {
    if (DataService.isAnonymous != true) {
      await AppManager.animateAndLoad(
        context,
        () => DataService.signInAnonymously(),
      );
    }
    if (widget.onLogin != null) {
      widget.onLogin?.call(true);
    } else {
      if (context.mounted) context.router.openBase(const HomeRoute());
    }
  }
}
