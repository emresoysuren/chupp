import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/colored_field.dart';
import 'package:flutter/material.dart';

class ProfileRegisterSide1 extends ProfileRegisterSideBase {
  final Function(String value)? onChanged;

  ProfileRegisterSide1(
    BuildContext context, {
    super.key,
    this.onChanged,
  }) : super(
          title: context.lang.current.profileRegisterSide1,
          details: context.lang.current.profileRegisterSide1Details,
          child: ColoredField(
            label: context.lang.current.profileRegisterSide1Field,
            onChanged: onChanged,
            next: true,
          ),
        );
}
