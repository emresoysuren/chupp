import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/texts.dart';
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
            title: Texts.theme,
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.solidCircleQuestion,
            title: Texts.faq,
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.solidUser,
            title: Texts.account,
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.headset,
            title: Texts.help,
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.solidFlag,
            title: Texts.report,
            onTap: () {},
          ),
        ],
      )),
    );
  }
}
