import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  final double? radius;
  final ImageProvider? image;

  const ProfilePhoto({
    super.key,
    this.radius,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: image,
      backgroundColor: context.theme.current.secondaryBg,
      backgroundImage: const AssetImage("assets/user-avatar.png"),
    );
  }
}
