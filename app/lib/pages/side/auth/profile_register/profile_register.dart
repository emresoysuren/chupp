import 'package:auto_route/auto_route.dart';
import 'package:chupp/models/picker_result.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_1.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_2.dart';
import 'package:chupp/pages/side/auth/profile_register/pages/side_3.dart';
import 'package:chupp/pages/side/auth/profile_register/profile_register_side_base.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/register/page_nav.dart';
import 'package:chupp/widgets/register/register_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProfileRegisterPage extends ConsumerStatefulWidget {
  final void Function()? validate;

  const ProfileRegisterPage({
    super.key,
    this.validate,
  });

  @override
  ConsumerState<ProfileRegisterPage> createState() =>
      _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends ConsumerState<ProfileRegisterPage> {
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
  void initState() {
    _controller.addListener(() {
      if ((currentPage - (_controller.page ?? 0)).abs() > 0.5) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.initState();
  }

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
      resizeToAvoidBottomInset: false,
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
        doneCall: () => _register(),
      ),
    );
  }

  Future<void> _register() async {
    final bool result = await AccountManager.userRegister(
      context,
      ref,
      username: username,
      about: about,
    );
    if (result) widget.validate?.call();
  }
}
