import 'package:chupp/utils/theme/config/app_theme_mode.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/buttons/custom/radio.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: TitleBar(
        title: context.lang.current.settingsTheme,
        pop: true,
      ),
      body: DisableScrollBehavior(
        child: ListView(
          children: [
            RadioListButton(
              title: "Dark",
              active: context.theme.rawMode == AppThemeMode.dark,
              onTap: () => context.theme.changeMode(AppThemeMode.dark),
            ),
            RadioListButton(
              title: "Light",
              active: context.theme.rawMode == AppThemeMode.light,
              onTap: () => context.theme.changeMode(AppThemeMode.light),
            ),
            RadioListButton(
              title: "System",
              active: context.theme.rawMode == AppThemeMode.system,
              onTap: () => context.theme.changeMode(AppThemeMode.system),
            ),
          ],
        ),
      ),
    );
  }
}
