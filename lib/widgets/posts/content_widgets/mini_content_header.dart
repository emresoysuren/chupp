import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';

class MiniContentHeader extends StatelessWidget {
  final String username;
  final String time;

  const MiniContentHeader({
    super.key,
    required this.username,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProfilePhoto(
          radius: 12,
          image: NetworkImage("https://picsum.photos/1920/1080"),
        ),
        const SizedBox(width: 8),
        Text(
          username,
          style: context.styles.text,
        ),
        const SizedBox(width: 8),
        Text(
          time,
          style: context.styles.mutted,
        )
      ],
    );
  }
}
