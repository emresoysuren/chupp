import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LikedPostsPage extends StatefulWidget {
  const LikedPostsPage({super.key});

  @override
  State<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends State<LikedPostsPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(title: "Liked Posts"),
      backgroundColor: context.theme.current.primaryBg,
      bottomNavigationBar: AppNavBar(
        current: 2,
        activeTap: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.ease,
        ),
      ),
      body: DisableScrollBehavior(
        child: ListView.builder(
          controller: _controller,
          itemCount: 4,
          itemBuilder: (context, index) => const MiniPost(),
        ),
      ),
    );
  }
}
