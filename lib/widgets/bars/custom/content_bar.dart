import 'package:chupp/utils/ui_manager.dart';
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
  final Function()? onButtonTap;
  final double? offset;
  final int? follower;
  final int? ink;
  final int? like;
  final int? comment;
  final IconData? buttonIcon;
  final bool pop;
  final EdgeInsets? padding;

  const ContentBar({
    super.key,
    this.controller,
    this.contentKey,
    this.title,
    this.time,
    this.onButtonTap,
    this.offset,
    this.follower,
    this.ink,
    this.like,
    this.comment,
    this.buttonIcon,
    this.pop = true,
    this.padding,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottom = [];
    if (follower != null) {
      bottom.addAll([
        if (bottom.isNotEmpty) const SizedBox(width: 16),
        FaIcon(
          FontAwesomeIcons.solidUser,
          color: context.theme.current.text,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          UiManager.numFormat(follower),
          style: context.styles.text,
        ),
      ]);
    }
    if (ink != null) {
      bottom.addAll([
        if (bottom.isNotEmpty) const SizedBox(width: 16),
        FaIcon(
          FontAwesomeIcons.droplet,
          color: context.theme.current.text,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          UiManager.numFormat(ink),
          style: context.styles.text,
        ),
      ]);
    }
    if (comment != null) {
      bottom.addAll([
        if (bottom.isNotEmpty) const SizedBox(width: 16),
        FaIcon(
          FontAwesomeIcons.solidMessage,
          color: context.theme.current.text,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          UiManager.numFormat(comment),
          style: context.styles.text,
        ),
      ]);
    }
    if (like != null) {
      bottom.addAll([
        if (bottom.isNotEmpty) const SizedBox(width: 16),
        FaIcon(
          FontAwesomeIcons.solidHeart,
          color: context.theme.current.text,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          UiManager.numFormat(like),
          style: context.styles.text,
        ),
      ]);
    }
    if (time != null) {
      bottom.addAll([
        if (bottom.isNotEmpty) const SizedBox(width: 8),
        Text(
          time!,
          style: context.styles.mutted,
        ),
      ]);
    }
    return ScrollAnimatedBar(
      offset: offset,
      title: title,
      contentKey: contentKey,
      controller: controller,
      pop: pop,
      padding: padding ??
          (onButtonTap == null
              ? null
              : EdgeInsets.only(left: pop ? 8 : 16, right: 8)),
      bottom: bottom,
      aside: [
        if (onButtonTap != null)
          SingleButton(
            onPressed: onButtonTap,
            child: Icon(
              buttonIcon ?? FontAwesomeIcons.ellipsis,
              color: context.theme.current.primaryItem,
            ),
          ),
      ],
    );
  }
}
