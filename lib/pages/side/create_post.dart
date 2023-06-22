import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/routes/card.dart';
import 'package:chupp/widgets/add_hastags.dart/add_hastags.dart';
import 'package:chupp/widgets/bars/bar.dart';
import 'package:chupp/widgets/buttons/single_plain_text_button.dart';
import 'package:chupp/widgets/cards/create_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool showHashtags = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool? result = await Navigator.push<bool>(
          context,
          CardRoute(
            child: const CreatePostCard(),
          ),
        );
        return result == true;
      },
      child: Scaffold(
        backgroundColor: Utils.theme.current.primaryBg,
        appBar: Bar(
          pop: true,
          popXmark: true,
          children: [
            Text(
              Texts.createPostTitle,
              style: Styles.title2,
            ),
            const Spacer(),
            SinglePlainTextButton(
              icon: const FaIcon(FontAwesomeIcons.hashtag).icon,
              label: Texts.createPostAddHashtag,
              color: Utils.theme.current.notice,
              onPressed: () {
                setState(() {
                  showHashtags = true;
                });
              },
            ),
            SinglePlainTextButton(
              icon: const FaIcon(FontAwesomeIcons.solidPaperPlane).icon,
              iconSize: 18,
              label: Texts.createPostPublish,
              color: Utils.theme.current.important,
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
                style: Styles.title2,
                decoration: InputDecoration(
                  hintText: Texts.createTitle,
                  hintStyle: Styles.title2.copyWith(
                    color: Utils.theme.current.subText,
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
                  style: Styles.text,
                  decoration: InputDecoration(
                    hintText: Texts.createPostwriteDescription,
                    hintStyle: Styles.subText,
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
                onUnFocused: () => setState(() => showHashtags = false),
              ),
      ),
    );
  }
}
