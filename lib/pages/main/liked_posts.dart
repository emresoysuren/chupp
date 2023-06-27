import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LikedPostsPage extends StatelessWidget {
  const LikedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleBar(title: "Liked Posts"),
      backgroundColor: context.theme.current.primaryBg,
      bottomNavigationBar: const AppNavBar(current: 2),
      body: DisableScrollBehavior(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => const MiniPost(),
        ),
      ),
    );
  }
}
