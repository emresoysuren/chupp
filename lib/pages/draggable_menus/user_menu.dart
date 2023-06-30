import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({super.key});

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
            title: Texts.userMenuShare,
            icon: FontAwesomeIcons.arrowUpRightFromSquare,
            iconSize: 20,
            color: context.theme.current.text,
            onTap: () {},
          ),
          ListButton(
            title: Texts.userMenuBlock,
            icon: FontAwesomeIcons.ban,
            iconSize: 20,
            color: context.theme.current.important,
            onTap: () {},
          ),
          ListButton(
            title: Texts.menuReport,
            icon: FontAwesomeIcons.solidFlag,
            iconSize: 20,
            color: context.theme.current.important,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
