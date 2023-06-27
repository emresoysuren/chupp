import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
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
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            // Direct to user's profile
          },
          child: Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
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
        ),
        const Spacer(),
        ...?children,
      ],
    );
  }
}
