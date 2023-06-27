import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class SearchHistoryContent extends StatelessWidget {
  const SearchHistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget will show users search history but if the user doesn't have a history, it'll show the empty search content.
    if (true) {
      return Center(
        child: Text(
          "data",
          style: context.styles.appTitle,
        ),
      );
    }
    // else {
    //   return const SearchEmptyContent();
    // }
  }
}
