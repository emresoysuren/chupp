import 'package:chupp/utils/lang/config/app_lang_mode.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/buttons/custom/radio.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: TitleBar(
        title: context.lang.current.settingsLanguage,
        pop: true,
      ),
      body: DisableScrollBehavior(
        child: ListView(
          children: [
            RadioListButton(
              title: context.lang.current.settingsLangSystem,
              active: context.lang.rawMode == AppLangMode.system,
              onTap: () => context.lang.changeMode(AppLangMode.system),
            ),
            RadioListButton(
              title: context.lang.current.settingsLangEng,
              active: context.lang.rawMode == AppLangMode.en,
              onTap: () => context.lang.changeMode(AppLangMode.en),
            ),
            RadioListButton(
              title: context.lang.current.settingsLangTurkish,
              active: context.lang.rawMode == AppLangMode.tr,
              onTap: () => context.lang.changeMode(AppLangMode.tr),
            ),
          ],
        ),
      ),
    );
  }
}
