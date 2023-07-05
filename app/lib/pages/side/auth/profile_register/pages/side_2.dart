import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/colored_field.dart';
import 'package:flutter/material.dart';

class ProfileRegisterSide2 extends ProfileRegisterSideBase {
  final Function(String value)? onChanged;

  ProfileRegisterSide2(
    BuildContext context, {
    super.key,
    this.onChanged,
  }) : super(
          title: context.lang.current.profileRegisterSide2,
          optional: true,
          details: context.lang.current.profileRegisterSide2Details,
          child: ColoredField(
            label: context.lang.current.profileRegisterSide2Field,
            type: TextInputType.multiline,
            onChanged: onChanged,
          ),
        );
}
