import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/widgets/colored_field.dart';

class ProfileRegisterSide3 extends ProfileRegisterSideBase {
  final Function(String value)? onChanged;

  ProfileRegisterSide3({
    super.key,
    this.onChanged,
  }) : super(
          title: Texts.profileRegisterSide1,
          details: Texts.profileRegisterSide1Details,
          child: ColoredField(
            label: "Username",
            onChanged: onChanged,
          ),
        );
}
