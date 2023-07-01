import 'package:chupp/widgets/profile/profile_photo.dart';
import 'package:flutter/material.dart';

class EditProfilePhoto extends StatelessWidget {
  final double? radius;
  final ImageProvider? image;

  const EditProfilePhoto({
    super.key,
    this.radius,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfilePhoto(
          image: image,
          radius: radius,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            shape: const OvalBorder(),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.transparent,
              enableFeedback: false,
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
