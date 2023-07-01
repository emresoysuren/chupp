import 'package:chupp/config/texts.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/hashtags/mini_hashtag.dart';
import 'package:chupp/widgets/posts/post/mini_post.dart';
import 'package:chupp/widgets/profile/mini_profile.dart';
import 'package:chupp/widgets/section.dart';
import 'package:flutter/material.dart';

class SearchResultContent extends StatelessWidget {
  const SearchResultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return DisableScrollBehavior(
      child: ListView(
        children: [
          Section(
            title: Texts.searchResultHashtags,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniHashtag(),
          ),
          Section(
            title: Texts.searchResultPeople,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniProfile(),
          ),
          Section(
            title: Texts.searchResultPosts,
            bottomLine: false,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniPost(),
          ),
        ],
      ),
    );
  }
}
