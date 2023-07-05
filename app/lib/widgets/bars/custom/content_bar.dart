import 'package:chupp/utils/app_manager.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/double_line_scroll_bar.dart';
import 'package:chupp/widgets/buttons/single_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentBar extends DoubleLineScrollBar {
  final String? title;
  final String? time;
  final int? follower;
  final int? ink;
  final int? like;
  final int? comment;
  final Function()? onButtonTap;
  final IconData? buttonIcon;

  const ContentBar({
    super.key,
    this.title,
    this.time,
    this.follower,
    this.ink,
    this.like,
    this.comment,
    this.onButtonTap,
    this.buttonIcon,
    super.contentKey,
    super.controller,
    super.offset,
    super.pop = true,
    super.popXmark,
    super.start,
    super.padding,
  });

  @override
  EdgeInsets? get padding =>
      super.padding ??
      (onButtonTap == null
          ? null
          : EdgeInsets.only(left: pop ? 8 : 16, right: 8));

  @override
  List<Widget>? get end => [
        if (onButtonTap != null)
          Builder(
            builder: (context) => SingleButton(
              onPressed: onButtonTap,
              child: Icon(
                buttonIcon ?? FontAwesomeIcons.ellipsis,
                color: context.theme.current.primaryItem,
              ),
            ),
          ),
      ];

  @override
  Widget? get top => title == null
      ? null
      : Builder(
          builder: (context) => Text(
            title!,
            style: context.styles.title3,
            overflow: TextOverflow.fade,
            softWrap: false,
            maxLines: 1,
          ),
        );

  @override
  Widget? get bottom => Builder(
        builder: (context) {
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
                AppManager.numFormat(follower),
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
                AppManager.numFormat(ink),
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
                AppManager.numFormat(comment),
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
                AppManager.numFormat(like),
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
          return Row(
            children: bottom,
          );
        },
      );
}
