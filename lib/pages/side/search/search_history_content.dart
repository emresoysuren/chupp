import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/buttons/list_button.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchHistoryContent extends StatelessWidget {
  final void Function(String value)? search;

  const SearchHistoryContent({
    super.key,
    this.search,
  });

  @override
  Widget build(BuildContext context) {
    // Widget will show users search history but if the user doesn't have a history, it'll show the empty search content.
    // if (true) {
    //   return const SearchEmptyContent();
    // }
    return DisableScrollBehavior(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Texts.searchContentHistory,
                  style: context.styles.title2,
                ),
                SingleButton(
                  onPressed: () {},
                  child: FaIcon(
                    FontAwesomeIcons.solidTrashCan,
                    size: 18,
                    color: context.theme.current.secondaryItem,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < 7; i++)
            ListButton(
              icon: const FaIcon(FontAwesomeIcons.clockRotateLeft).icon,
              title: "title $i",
              onTap: () => search?.call("title $i"),
            ),
        ],
      ),
    );
  }
}
