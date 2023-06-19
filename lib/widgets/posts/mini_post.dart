import 'package:chupp/config/styles.dart';
import 'package:flutter/material.dart';

class MiniPost extends StatelessWidget {
  const MiniPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const Row(),
            Text(
              "Which one is sth?",
              style: Styles.title,
            ),
            const Wrap(),
            const Row(),
          ],
        ),
        const Column(
          children: [
            Row(),
            Row(),
          ],
        ),
      ],
    );
  }
}
