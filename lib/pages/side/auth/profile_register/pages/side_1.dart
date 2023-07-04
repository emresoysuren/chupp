import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/widgets/colored_field.dart';

class ProfileRegisterSide1 extends ProfileRegisterSideBase {
  final Function(String value)? onChanged;

  ProfileRegisterSide1({
    super.key,
    this.onChanged,
  }) : super(
          title: Texts.profileRegisterSide1,
          details: Texts.profileRegisterSide1Details,
          child: ColoredField(
            label: Texts.profileRegisterSide1Field,
            onChanged: onChanged,
            next: true,
          ),
        );
}
