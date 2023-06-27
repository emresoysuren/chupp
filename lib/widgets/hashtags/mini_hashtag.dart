import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MiniHashtag extends StatelessWidget {
  const MiniHashtag({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        enableFeedback: false,
        highlightColor: Colors.transparent,
        // onTap: () => Navigator.push(
        //   context,
        //   BasicPageRoute(
        //     start: Start.right,
        //     child: const HashtahPage(),
        //   ),
        // ),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Texts.hashtagHeaderPrefix} 34k ${Texts.hashtagHeaderSuffix}",
                style: context.styles.mutted,
              ),
              const SizedBox(height: 4),
              Text(
                "#hashtag",
                style: context.styles.title3,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.solidHeart,
                    color: context.theme.current.subText,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "1.6k",
                    style: context.styles.mutted,
                  ),
                  const SizedBox(width: 16),
                  FaIcon(
                    FontAwesomeIcons.droplet,
                    color: context.theme.current.subText,
                    size: 14,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "4.6k",
                    style: context.styles.mutted,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
