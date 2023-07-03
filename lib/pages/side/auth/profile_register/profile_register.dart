import 'package:auto_route/auto_route.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_1.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_2.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_3.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/register/register_header.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileRegisterPage extends StatefulWidget {
  final Function(bool result)? onLogin;

  const ProfileRegisterPage({
    super.key,
    this.onLogin,
  });

  @override
  State<ProfileRegisterPage> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegisterPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  List<ProfileRegisterSideBase> get pages => [
        ProfileRegisterSide1(),
        ProfileRegisterSide2(),
        ProfileRegisterSide3(),
      ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: RegisterHeader(
        current: currentPage + 1,
        total: pages.length,
      ),
      body: DisableScrollBehavior(
        child: PageView(
          controller: _controller,
          onPageChanged: (value) => currentPage = value,
          children: pages,
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16),
        child: Button(
          large: true,
          label: "Next",
        ),
      ),
    );
  }
}
