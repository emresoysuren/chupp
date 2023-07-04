import 'package:auto_route/auto_route.dart';
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
  final void Function()? validate;

  const AuthPage({
    super.key,
    this.validate,
  });

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
                context.lang.current.authLoginTo,
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
          label: context.lang.current.authEmail,
          type: TextInputType.emailAddress,
          onChanged: (value) => setState(() => email = value),
        ),
        const SizedBox(height: 16),
        ColoredField(
          label: context.lang.current.authPassword,
          type: TextInputType.visiblePassword,
          onChanged: (value) => setState(() => password = value),
        ),
        const SizedBox(height: 16),
        Button(
          large: true,
          label: context.lang.current.authLogin,
          onPressed: () => login(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Button(
                large: true,
                secondary: true,
                label: context.lang.current.authGoogleLogin,
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
                label: context.lang.current.authAppleLogin,
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
            label: context.lang.current.authHelp,
            onPressed: () {},
          ),
        ),
      ],
      bottom: [
        Button(
          large: true,
          secondary: true,
          label: context.lang.current.authRegister,
          onPressed: () => register(),
        ),
        const SizedBox(height: 16),
        Button(
          large: true,
          secondary: true,
          label: context.lang.current.authWithoutLogin,
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
    if (widget.validate != null) {
      widget.validate?.call();
    } else {
      if (context.mounted) context.router.openBase(const HomeRoute());
    }
  }
}
