import 'package:auto_route/annotations.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/draggable_menus/profile_menu.dart';
import 'package:chupp/pages/draggable_menus/user_menu.dart';
import 'package:chupp/utils/account_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/custom_silver_header_delegate.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/page_category/page_category.dart';
import 'package:chupp/widgets/posts/opinion/mini_opinion.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:chupp/widgets/profile/profile_header.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage.uid({super.key, required this.uid});

  ProfilePage({super.key}) : uid = AccountManager.ownerUid!;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _controller = ScrollController();
  final PageController _pageController = PageController();
  final GlobalKey _contentKey = GlobalKey();
  late final bool isOwner = AccountManager.isOwner(widget.uid);

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
        follower: 2100,
        ink: 216,
        comment: 38,
        controller: _controller,
        contentKey: _contentKey,
        pop: !isOwner,
        buttonIcon: FontAwesomeIcons.bars,
        onButtonTap: () => DraggableMenu.open(
          context,
          isOwner ? const ProfileMenu() : const UserMenu(),
          barrierColor: context.theme.current.barrierColor,
        ),
      ),
      bottomNavigationBar: !isOwner
          ? null
          : AppNavBar(
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
            SliverToBoxAdapter(
              child: ProfileHeader(
                key: _contentKey,
                isOwner: isOwner,
                title: "username",
                follower: 2100,
                ink: 216,
                comment: 38,
              ),
            ),
            SliverPersistentHeader(
              delegate: CustomSliverPersistentHeaderDelegate(
                PageCategory(
                  pages: const [Texts.profilePosts, Texts.profileOpinions],
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
                    for (int i = 0; i < 6; i++) const MiniOpinion(on: true),
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
