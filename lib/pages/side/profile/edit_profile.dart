import 'dart:ui';
import 'package:chupp/config/color_palette.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/scroll_animated_bar.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey _photoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      body: Stack(
        children: [
          DisableScrollBehavior(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        "https://picsum.photos/1920/1080",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: ColoredBox(
                        color: ColorPalette.black.withOpacity(0.36),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 64, bottom: 48),
                          child: Center(
                            child: Container(
                              key: _photoKey,
                              height: 128,
                              width: 128,
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: context.styles.title3,
                      ),
                      TextFormField(
                        initialValue: "username",
                        style: context.styles.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: Texts.editProfileUsernameHint,
                          hintStyle: context.styles.mutted,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "About",
                        style: context.styles.title3,
                      ),
                      TextFormField(
                        initialValue: "About",
                        style: context.styles.text,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: Texts.editProfileAboutHint,
                          hintStyle: context.styles.mutted,
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ScrollAnimatedBar(
              backgroundColor: Colors.transparent,
              popColor: ColorPalette.white,
              start: [
                Text(
                  "Edit Profile",
                  style:
                      context.styles.title2.copyWith(color: ColorPalette.white),
                ),
                const Spacer(),
              ],
              contentKey: _photoKey,
              pop: true,
              popXmark: true,
              child: Container(
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: context.theme.current.primaryBg,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Button(
            large: true,
            label: Texts.editProfileSaveChanges,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
