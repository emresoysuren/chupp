import 'package:chupp/pages/draggable_menus/content_menu.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/custom/content_bar.dart';
import 'package:chupp/widgets/custom_silver_header_delegate.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/hashtags/hashtag_header.dart';
import 'package:chupp/widgets/page_category/page_category.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:draggable_menu/draggable_menu.dart';
import 'package:flutter/material.dart';

class HashtagPage extends StatefulWidget {
  const HashtagPage({super.key});

  @override
  State<HashtagPage> createState() => _HashtagPageState();
}

class _HashtagPageState extends State<HashtagPage> {
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
        title: "#hashtag",
        ink: 460,
        comment: 308,
        like: 120,
        controller: _controller,
        contentKey: _contentKey,
        onButtonTap: () => DraggableMenu.open(
          context,
          const ContentMenu(),
          barrierColor: context.theme.current.barrierColor,
        ),
      ),
      body: DisableScrollBehavior(
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: HashtagHeader(
                key: _contentKey,
                title: "#hashtag",
                ink: 460,
                comment: 308,
                like: 120,
              ),
            ),
            SliverPersistentHeader(
              delegate: CustomSliverPersistentHeaderDelegate(
                PageCategory(
                  pages: [
                    context.lang.current.hashtagNewest,
                    context.lang.current.hashtagTrending,
                    context.lang.current.hashtagMostLiked,
                  ],
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
