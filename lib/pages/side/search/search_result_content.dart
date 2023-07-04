import 'package:chupp/utils/utils/context_extension.dart';
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
            title: context.lang.current.searchResultHashtags,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniHashtag(),
          ),
          Section(
            title: context.lang.current.searchResultPeople,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniProfile(),
          ),
          Section(
            title: context.lang.current.searchResultPosts,
            bottomLine: false,
            itemCount: 3,
            itemBuilder: (context, index) => const MiniPost(),
          ),
        ],
      ),
    );
  }
}
