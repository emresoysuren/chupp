import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfilePhotoMenu extends StatelessWidget {
  const EditProfilePhotoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableMenu(
      allowToShrink: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Choose a Photo",
              style: context.styles.title3,
            ),
          ),
          const SizedBox(height: 4),
          ListButton(
            icon: FontAwesomeIcons.solidImages,
            title: "Gallery",
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.camera,
            title: "Camera",
            onTap: () {},
          ),
          ListButton(
            icon: FontAwesomeIcons.solidTrashCan,
            title: "Delete the photo",
            color: context.theme.current.important,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
