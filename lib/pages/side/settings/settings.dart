import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/settings/account.dart';
import 'package:chupp/pages/side/settings/faq.dart';
import 'package:chupp/pages/side/settings/help.dart';
import 'package:chupp/pages/side/settings/report.dart';
import 'package:chupp/pages/side/settings/theme.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: const TitleBar(
        title: Texts.settings,
        pop: true,
      ),
      body: DisableScrollBehavior(
          child: ListView(
        children: [
          ListButton(
            icon: FontAwesomeIcons.solidMoon,
            title: Texts.settingsTheme,
            onTap: () => Navigator.push(
              context,
              BasicPageRoute(start: Start.right, child: const ThemePage()),
            ),
          ),
          ListButton(
            icon: FontAwesomeIcons.solidCircleQuestion,
            title: Texts.settingsFaq,
            onTap: () => Navigator.push(
              context,
              BasicPageRoute(start: Start.right, child: const FaqPage()),
            ),
          ),
          ListButton(
            icon: FontAwesomeIcons.solidUser,
            title: Texts.settingsAccount,
            onTap: () => Navigator.push(
              context,
              BasicPageRoute(start: Start.right, child: const AccountPage()),
            ),
          ),
          ListButton(
            icon: FontAwesomeIcons.headset,
            title: Texts.settingsHelp,
            onTap: () => Navigator.push(
              context,
              BasicPageRoute(start: Start.right, child: const HelpPage()),
            ),
          ),
          ListButton(
            icon: FontAwesomeIcons.solidFlag,
            title: Texts.settingsReport,
            onTap: () => Navigator.push(
              context,
              BasicPageRoute(start: Start.right, child: const ReportPage()),
            ),
          ),
        ],
      )),
    );
  }
}
