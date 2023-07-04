import 'package:auto_route/auto_route.dart';
import 'package:chupp/models/picker_result.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_1.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_2.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_3.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/register/page_nav.dart';
import 'package:chupp/widgets/register/register_header.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileRegisterPage extends StatefulWidget {
  final void Function()? validate;

  const ProfileRegisterPage({
    super.key,
    this.validate,
  });

  @override
  State<ProfileRegisterPage> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegisterPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<ProfileRegisterSideBase> get pages => [
        ProfileRegisterSide1(
          context,
          onChanged: (value) => username = value,
        ),
        ProfileRegisterSide2(
          context,
          onChanged: (value) => about = value,
        ),
        ProfileRegisterSide3(
          context,
          onChanged: (result) {
            pickerResult = result;
          },
        ),
      ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Register State

  String username = "";
  String about = "";
  PickerResult? pickerResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: RegisterHeader(
        current: currentPage + 1,
        total: pages.length,
        validate: widget.validate,
      ),
      body: DisableScrollBehavior(
        child: PageView(
          controller: _controller,
          onPageChanged: (value) => setState(() => currentPage = value),
          children: pages,
        ),
      ),
      bottomNavigationBar: PageNav(
        current: currentPage,
        total: pages.length,
        controller: _controller,
        doneCall: () {},
      ),
    );
  }
}
