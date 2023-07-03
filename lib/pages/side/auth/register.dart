import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/auth/auth_base.dart';
import 'package:chupp/widgets/auth/field.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String password = "";
  String passwordCheck = "";
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
                Texts.registerTo,
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
          label: Texts.registerEmail,
          onChanged: (value) => setState(() => email = value),
        ),
        const SizedBox(height: 16),
        AuthField(
          label: Texts.registerPassword,
          password: true,
          onChanged: (value) => setState(() => password = value),
        ),
        const SizedBox(height: 16),
        AuthField(
          label: Texts.registerPasswordCheck,
          password: true,
          onChanged: (value) => setState(() => passwordCheck = value),
        ),
        const SizedBox(height: 16),
        Button(
          large: true,
          label: Texts.register,
          onPressed: () => register(),
        ),
        const SizedBox(height: 16),
        Center(
          child: SinglePlainTextButton(
            label: Texts.registerHelp,
            onPressed: () {},
          ),
        ),
      ],
      bottom: [
        Button(
          large: true,
          secondary: true,
          label: Texts.registerLogin,
          onPressed: () => Navigator.maybePop(context),
        ),
      ],
    );
  }

  Future<void> register() async {
    final bool result = await AccountManager.emailRegister(
        context, email, password, passwordCheck);
    if (mounted && result) Navigator.pop<bool>(context, true);
  }
}
