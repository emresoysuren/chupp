import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/auth/register.dart';
import 'package:chupp/routes/non_animated.dart';
import 'package:chupp/services/data_service.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/extensions.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/auth/auth_base.dart';
import 'package:chupp/widgets/colored_field.dart';
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
    return AuthBase(
      top: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Texts.authLoginTo,
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
        ColoredField(
          label: Texts.authEmail,
          type: TextInputType.emailAddress,
          onChanged: (value) => setState(() => email = value),
        ),
        const SizedBox(height: 16),
        ColoredField(
          label: Texts.authPassword,
          type: TextInputType.visiblePassword,
          onChanged: (value) => setState(() => password = value),
        ),
        const SizedBox(height: 16),
        Button(
          large: true,
          label: Texts.authLogin,
          onPressed: () => login(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Button(
                large: true,
                secondary: true,
                label: Texts.authGoogleLogin,
                icon: FontAwesomeIcons.google,
                iconSize: 18,
                onPressed: () => googleLogin(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Button(
                large: true,
                secondary: true,
                label: Texts.authAppleLogin,
                icon: FontAwesomeIcons.apple,
                iconSize: 18,
                onPressed: () => appleLogin(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: SinglePlainTextButton(
            label: Texts.authHelp,
            onPressed: () {},
          ),
        ),
      ],
      bottom: [
        Button(
          large: true,
          secondary: true,
          label: Texts.authRegister,
          onPressed: () => register(),
        ),
        const SizedBox(height: 16),
        Button(
          large: true,
          secondary: true,
          label: Texts.authWithoutLogin,
          onPressed: () => signInAnonymously(context),
        ),
      ],
    );
  }

  Future<void> signInAnonymously(BuildContext context) async {
    if (DataService.isAnonymous != true) {
      final bool result = await AccountManager.signInAnonymously(context);
      if (!result) return;
    }
    _direct();
  }

  Future<void> login() async {
    final bool result =
        await AccountManager.emailLogin(context, email, password);
    if (result) _direct();
  }

  Future<void> googleLogin() async {
    final bool result = await AccountManager.googleLogin(context);
    if (result) _direct();
  }

  Future<void> appleLogin() async {
    final bool result = await AccountManager.appleLogin(context);
    if (result) _direct();
  }

  Future<void> register() async {
    final result = await Navigator.push<bool>(
      context,
      NonAnimatedPageRoute(child: const RegisterPage()),
    );
    if (result == true) _direct();
  }

  void _direct() {
    if (widget.onLogin != null) {
      widget.onLogin?.call(true);
    } else {
      if (context.mounted) context.router.openBase(const HomeRoute());
    }
  }
}
