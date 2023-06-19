import 'package:chupp/config/styles.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:flutter/material.dart';

class MiniPost extends StatelessWidget {
  const MiniPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "username",
                              style: Styles.text,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "5/30/14 19:26",
                              style: Styles.subText,
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Which character is more likely to die next?",
                          style: Styles.title3,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 18,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) =>
                                const HashtagChip(tag: "text"),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  "idk anything",
                                  style: Styles.textImp,
                                  maxLines: 1,
                                  softWrap: false,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  "Option 2",
                                  style: Styles.textImp,
                                  maxLines: 1,
                                  softWrap: false,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.fade,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SinglePlainTextButton(
                  icon: Icons.water_drop_rounded,
                  label: "4.6k",
                  gap: 4,
                  onPressed: () {},
                ),
                SinglePlainTextButton(
                  icon: Icons.comment_rounded,
                  label: "308",
                  gap: 4,
                  onPressed: () {},
                ),
                SinglePlainTextButton(
                  icon: Icons.favorite_rounded,
                  label: "1.2k",
                  gap: 4,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
