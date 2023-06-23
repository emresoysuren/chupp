import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/scroll_animated_bar.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentBar extends StatelessWidget implements PreferredSizeWidget {
  final ScrollController? controller;
  final GlobalKey? contentKey;
  final String? title;
  final String? time;
  final String? ink;
  final Function()? onButtonTap;

  const ContentBar({
    super.key,
    this.controller,
    this.contentKey,
    this.title,
    this.time,
    this.ink,
    this.onButtonTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return ScrollAnimatedBar(
      title: title,
      contentKey: contentKey,
      controller: controller,
      bottom: [
        if (ink != null)
          FaIcon(
            FontAwesomeIcons.droplet,
            color: context.theme.current.text,
            size: 16,
          ),
        if (ink != null) const SizedBox(width: 4),
        if (ink != null)
          Text(
            ink!,
            style: context.styles.text,
          ),
        if (time != null) const SizedBox(width: 8),
        if (time != null)
          Text(
            time!,
            style: context.styles.subText,
          ),
      ],
      aside: [
        if (onButtonTap != null)
          SingleButton(
            onPressed: onButtonTap,
            child: FaIcon(
              FontAwesomeIcons.ellipsis,
              color: context.theme.current.primaryItem,
            ),
          )
      ],
    );
  }
}
