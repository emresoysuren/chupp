import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  final String username;
  final String time;
  final String? option;
  final List<Widget>? children;

  const ContentHeader({
    super.key,
    required this.username,
    required this.time,
    this.option,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const ProfilePhoto(
              radius: 18,
              image: NetworkImage("https://picsum.photos/1920/1080"),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RichText(
                  text: TextSpan(
                    style: context.styles.text,
                    children: [
                      TextSpan(text: username),
                      if (option != null)
                        TextSpan(
                          text: " ${Texts.postUserOpinionFor} ",
                          style: context.styles.mutted,
                        ),
                      if (option != null) TextSpan(text: option),
                    ],
                  ),
                ),
                Text(
                  time,
                  style: context.styles.mutted,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        ...?children,
      ],
    );
  }
}
