import 'package:chupp/config/texts.dart';
import 'package:chupp/models/picker_result.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/widgets/profile/edit_profile_photo.dart';
import 'package:flutter/material.dart';

class ProfileRegisterSide3 extends ProfileRegisterSideBase {
  final Function(PickerResult result)? onChanged;
  final ImageProvider? image;

  ProfileRegisterSide3({
    super.key,
    this.onChanged,
    this.image,
  }) : super(
          title: Texts.profileRegisterSide3,
          optional: true,
          details: Texts.profileRegisterSide3Details,
          child: LayoutBuilder(builder: (context, c) {
            return Center(
              child: EditProfilePhoto(
                radius: (c.maxHeight / 2) * 0.64,
                onChanged: onChanged,
                allowReset: false,
              ),
            );
          }),
        );
}
