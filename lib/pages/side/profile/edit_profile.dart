import 'dart:ui';
import 'package:chupp/models/picker_result.dart';
import 'package:chupp/routes/card.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/widgets/bars/scroll_animated_bar.dart';
import 'package:chupp/widgets/buttons/button.dart';
import 'package:chupp/widgets/cards/discard_card.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/profile/edit_profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late AppTheme theme;
  final GlobalKey _photoKey = GlobalKey();
  final ScrollController _controller = ScrollController();
  late String username;
  late String about;
  PickerResult? image;

  ImageProvider? get _profilePhoto {
    if (_isImageNotChanged) {
      return const NetworkImage("https://picsum.photos/1920/1080");
    } else {
      if (image!.bytes == null) {
        return null;
      } else {
        return MemoryImage(image!.bytes!);
      }
    }
  }

  bool get _isImageNotChanged => image?.reset != false;

  @override
  void initState() {
    username = "username";
    about = "about";
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // To listen to the MediaQuery
    MediaQuery.of(context);
    // To be able to dispose it later
    theme = context.theme;
    SystemChrome.setSystemUIOverlayStyle(
      // Sets the System UI Overlay to static value
      // This can be bad for responsive design
      context.theme.defaultSystemUIOverlay.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    theme.resetSystemUiColor();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (username == "username" && about == "about" && _isImageNotChanged) {
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
        body: Stack(
          children: [
            DisableScrollBehavior(
              child: ListView(
                padding: const EdgeInsets.all(0),
                controller: _controller,
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: _profilePhoto ??
                              const AssetImage("assets/user-avatar.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: ColoredBox(
                          color:
                              context.theme.current.primaryBg.withOpacity(0.36),
                        ),
                      ),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 64, bottom: 48),
                            child: Center(
                              child: EditProfilePhoto(
                                key: _photoKey,
                                radius: 64,
                                onChanged: (result) =>
                                    setState(() => image = result),
                                image: const NetworkImage(
                                  "https://picsum.photos/1920/1080",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.lang.current.editProfileUsername,
                          style: context.styles.title3,
                        ),
                        TextFormField(
                          initialValue: username,
                          style: context.styles.text,
                          onChanged: (value) =>
                              setState(() => username = value),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText:
                                context.lang.current.editProfileUsernameHint,
                            hintStyle: context.styles.mutted,
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            border: InputBorder.none,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.lang.current.editProfileAbout,
                          style: context.styles.title3,
                        ),
                        TextFormField(
                          initialValue: about,
                          style: context.styles.text,
                          onChanged: (value) => setState(() => about = value),
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: context.lang.current.editProfileAboutHint,
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
                backgroundColor: context.theme.current.primaryBg,
                backgroundAnimation: true,
                fixedLenght: 92,
                start: [
                  Text(
                    context.lang.current.editProfile,
                    style: context.styles.title2,
                  ),
                  const Spacer(),
                ],
                contentKey: _photoKey,
                controller: _controller,
                pop: true,
                popXmark: true,
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
              label: context.lang.current.editProfileSaveChanges,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
