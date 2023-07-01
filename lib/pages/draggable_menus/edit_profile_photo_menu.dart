import 'dart:typed_data';

import 'package:chupp/models/picker_result.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
            onTap: () => pick(context, ImageSource.gallery),
          ),
          ListButton(
            icon: FontAwesomeIcons.camera,
            title: "Camera",
            onTap: () => pick(context, ImageSource.camera),
          ),
          ListButton(
            icon: FontAwesomeIcons.solidTrashCan,
            title: "Delete the photo",
            color: context.theme.current.important,
            onTap: () => Navigator.pop<PickerResult>(context, PickerResult()),
          ),
        ],
      ),
    );
  }

  pick(BuildContext context, ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    final Uint8List bytes = await image.readAsBytes();
    if (context.mounted) {
      Navigator.pop<PickerResult>(context, PickerResult(bytes: bytes));
    }
  }
}
