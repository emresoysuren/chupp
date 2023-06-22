import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserOpinion extends StatelessWidget {
  const UserOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: Styles.text,
                    children: [
                      const TextSpan(text: "username"),
                      TextSpan(
                        text: " ${Texts.postUserOpinionFor} ",
                        style: Styles.subText,
                      ),
                      const TextSpan(text: "#option"),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "5/30/14 19:26",
                  style: Styles.subText,
                ),
                const SizedBox(height: 8),
                ExpandableText(
                  "Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint. Cupidatat deserunt nisi nulla Lorem Lorem Lorem pariatur irure cupidatat elit est exercitation sint.",
                  style: Styles.text,
                ),
                const SizedBox(height: 4),
                SinglePlainTextButton(
                  icon: const FaIcon(FontAwesomeIcons.droplet).icon,
                  iconSize: 16,
                  label: "4.6k",
                  gap: 4,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
