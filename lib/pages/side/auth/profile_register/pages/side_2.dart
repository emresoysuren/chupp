import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/widgets/colored_field.dart';
import 'package:flutter/material.dart';

class ProfileRegisterSide2 extends ProfileRegisterSideBase {
  final Function(String value)? onChanged;

  ProfileRegisterSide2({
    super.key,
    this.onChanged,
  }) : super(
          title: Texts.profileRegisterSide2,
          optional: true,
          details: Texts.profileRegisterSide2Details,
          child: ColoredField(
            label: Texts.profileRegisterSide2Field,
            type: TextInputType.multiline,
            onChanged: onChanged,
          ),
        );
}
