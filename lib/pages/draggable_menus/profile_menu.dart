import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/extensions.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      ui: ClassicDraggableMenu(
        color: context.theme.current.secondaryBg,
      ),
      allowToShrink: true,
      child: Column(
        children: [
          ListButton(
            title: Texts.profileSettings,
            icon: FontAwesomeIcons.gear,
            iconSize: 20,
            color: context.theme.current.text,
            onTap: () => context.router.open(const SettingsRoute()),
          ),
          ListButton(
            title: Texts.profileMenuShare,
            icon: FontAwesomeIcons.arrowUpRightFromSquare,
            iconSize: 20,
            color: context.theme.current.text,
            onTap: () {},
          ),
          if (!AccountManager.isAnonymous)
            ListButton(
              title: Texts.signOut,
              icon: FontAwesomeIcons.rightFromBracket,
              iconSize: 20,
              color: context.theme.current.important,
              onTap: () => AccountManager.signOut(context),
            )
          else
            ListButton(
              title: Texts.profileMenuAnonymousLoginOrRegister,
              icon: FontAwesomeIcons.rightToBracket,
              iconSize: 20,
              color: context.theme.current.notice,
              onTap: () => context.router.openBase(AuthRoute()),
            ),
        ],
      ),
    );
  }
}
