import 'package:chupp/config/texts.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/draggable_menu/draggable_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostMenu extends StatelessWidget {
  const PostMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      ui: ClassicDraggableMenu(
        color: Utils.theme.current.secondaryBg,
      ),
      allowToShrink: true,
      child: Column(
        children: [
          DraggableButton(
            title: Texts.postMenuViewProfile,
            icon: const FaIcon(FontAwesomeIcons.solidUser).icon,
            iconSize: 20,
            color: Utils.theme.current.text,
            onTap: () {},
          ),
          DraggableButton(
            title: Texts.postMenuShare,
            icon: const FaIcon(FontAwesomeIcons.arrowUpRightFromSquare).icon,
            iconSize: 20,
            color: Utils.theme.current.text,
            onTap: () {},
          ),
          DraggableButton(
            title: Texts.postMenuReport,
            icon: const FaIcon(FontAwesomeIcons.solidFlag).icon,
            iconSize: 20,
            color: Utils.theme.current.important,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
