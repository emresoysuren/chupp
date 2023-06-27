import 'package:auto_route/annotations.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: const Bar(
        center: true,
        child: SizedBox(
          height: 48,
          width: 120,
          child: RiveAnimation.asset(
            "assets/chupp-blue.riv",
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: DisableScrollBehavior(
        child: ListView.builder(
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, index) => const MiniPost(),
        ),
      ),
      bottomNavigationBar: AppNavBar(
        current: 0,
        activeTap: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
