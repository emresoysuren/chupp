import 'package:chupp/utils/utils/context_extension.dart';
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
        Container(
          height: 24,
          width: 24,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
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
