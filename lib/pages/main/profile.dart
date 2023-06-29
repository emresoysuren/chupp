import 'package:auto_route/annotations.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/draggable_menus/content_menu.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/custom_silver_header_delegate.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/page_category/page_category.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:chupp/widgets/profile/profile_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _controller = ScrollController();
  final PageController _pageController = PageController();
  final GlobalKey _contentKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      appBar: ContentBar(
        title: "username",
        ink: 460,
        comment: 308,
        like: 120,
        controller: _controller,
        contentKey: _contentKey,
        onButtonTap: () => DraggableMenu.open(context, const ContentMenu()),
      ),
      bottomNavigationBar: AppNavBar(
        current: 3,
        activeTap: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.ease,
        ),
      ),
      body: DisableScrollBehavior(
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              delegate: CustomSliverPersistentHeaderDelegate(
                PreferredSize(
                  preferredSize: const Size.fromHeight(192),
                  child: ProfileHeader(
                    key: _contentKey,
                    isOwner: true,
                    title: "username",
                    follower: 210,
                    ink: 460,
                    comment: 308,
                  ),
                ),
              ),
              pinned: false,
              floating: false,
            ),
            SliverPersistentHeader(
              delegate: CustomSliverPersistentHeaderDelegate(
                PageCategory(
                  pages: const [Texts.profilePosts, Texts.profileComments],
                  controller: _pageController,
                ),
              ),
              pinned: true,
              floating: true,
            ),
          ],
          body: PageView(
            controller: _pageController,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < 6; i++) const MiniPost(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < 6; i++) const MiniPost(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
