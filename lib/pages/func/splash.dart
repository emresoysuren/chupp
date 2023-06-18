import 'package:chupp/config/color_palette.dart';
import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/pages/main/home.dart';
import 'package:chupp/routes/non_animated.dart';
import 'package:chupp/widgets/title_loading.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Using the load method due to initState can't work with async
    load();
    // DO NOT do any operation here. Do it inside of the load method instead.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // TODO: Change the black color usage after implementing a theme management system
      backgroundColor: ColorPalette.black,
      body: Center(
        child: TitleLoading(
          title: Texts.title,
          style: Styles.titleLoading,
        ),
      ),
    );
  }

  Future<void> load() async {
    // Load something in here
    // TODO: Load the Firebase Here
    await Future.delayed(const Duration(seconds: 3));
    // Direct to somewhere
    // TODO: Change this after the Auto Router
    if (mounted) {
      Navigator.pushReplacement(
          context, NonAnimatedPageRoute(child: const HomePage()));
    }
  }
}
