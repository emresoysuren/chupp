import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileRegisterMenu extends StatelessWidget {
  final void Function()? validate;

  const ProfileRegisterMenu({
    super.key,
    this.validate,
  });

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
            title: context.lang.current.profileSettings,
            icon: FontAwesomeIcons.gear,
            iconSize: 20,
            color: context.theme.current.text,
            // onTap: () => context.router.open(const SettingsRoute()),
          ),
          ListButton(
            title: context.lang.current.signOut,
            icon: FontAwesomeIcons.rightFromBracket,
            iconSize: 20,
            color: context.theme.current.important,
            onTap: () async {
              await AccountManager.signOut(context);
              validate?.call();
            },
          ),
        ],
      ),
    );
  }
}
