import 'package:auto_route/annotations.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/side/search/search_query_page.dart';
import 'package:chupp/routes/non_animated.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/hashtags/mini_hashtag.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:chupp/widgets/search/search_widget.dart';
import 'package:chupp/widgets/section.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      appBar: Bar(
        child: SearchWidget(
          overRide: () => Navigator.push(
            context,
            NonAnimatedPageRoute(
              child: const SearchQueryPage(),
            ),
          ),
        ),
      ),
      body: DisableScrollBehavior(
        child: ListView(
          controller: _controller,
          children: [
            Section(
              title: Texts.trending,
              titleGap: 8,
              itemCount: 3,
              itemBuilder: (context, index) => const MiniHashtag(),
            ),
            Section(
              title: Texts.popularPosts,
              bottomLine: false,
              titleGap: 0,
              itemCount: 3,
              itemBuilder: (context, index) => const MiniPost(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppNavBar(
        current: 1,
        activeTap: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
