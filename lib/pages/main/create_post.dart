import 'package:auto_route/auto_route.dart';
import 'package:chupp/routes/card.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/add_hastags.dart/add_hastags.dart';
import 'package:chupp/widgets/bars/custom/title_bar.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/cards/discard_card.dart';
import 'package:chupp/widgets/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class CreatePostPage extends StatefulWidget implements PreferredSizeWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _CreatePostPageState extends State<CreatePostPage> {
  String title = "";
  String description = "";
  Set<String> hashtags = {};
  bool showHashtags = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (title.isEmpty && description.isEmpty && hashtags.isEmpty) {
          return true;
        }
        final bool? result = await Navigator.push<bool>(
          context,
          CardRoute(
            context,
            child: const DiscardChangesCard(),
          ),
        );
        return result == true;
      },
      child: Scaffold(
        backgroundColor: context.theme.current.primaryBg,
        appBar: TitleBar(
          pop: true,
          popXmark: true,
          title: context.lang.current.createPostTitle,
          items: [
            SinglePlainTextButton(
              icon: const FaIcon(FontAwesomeIcons.hashtag).icon,
              label: context.lang.current.createPostAddHashtag,
              color: context.theme.current.notice,
              onPressed: () {
                setState(() {
                  showHashtags = true;
                });
              },
            ),
            SinglePlainTextButton(
              icon: const FaIcon(FontAwesomeIcons.solidPaperPlane).icon,
              iconSize: 18,
              label: context.lang.current.createPostPublish,
              color: context.theme.current.important,
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (hashtags.isNotEmpty) ...[
                Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    for (String tag in hashtags)
                      HashtagChip(
                        tag: tag,
                        onTap: () => setState(() => hashtags.remove(tag)),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
              TextField(
                // focusNode: focusNode,
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                inputFormatters: [LengthLimitingTextInputFormatter(64)],
                autofocus: true,
                maxLines: null,
                style: context.styles.title2,
                decoration: InputDecoration(
                  hintText: context.lang.current.createTitle,
                  hintStyle: context.styles.title2.copyWith(
                    color: context.theme.current.subText,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TextField(
                  // focusNode: focusNode,
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  maxLines: null,
                  style: context.styles.text,
                  decoration: InputDecoration(
                    hintText: context.lang.current.createPostwriteDescription,
                    hintStyle: context.styles.mutted,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: !showHashtags
            ? null
            : AddHastags(
                hashtags: hashtags,
                onUnFocused: () => setState(() => showHashtags = false),
                onAdd: (hashtag) => setState(() => hashtags.add(hashtag)),
              ),
      ),
    );
  }
}
