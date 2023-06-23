import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/color_palette.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:rive/rive.dart';

@RoutePage()
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

  String get riveAnimation =>
      context.theme.current.splashItem == ColorPalette.white
          ? "assets/chupp.riv"
          : "assets/chupp-blue.riv";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.splashBg,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 92,
              child: RiveAnimation.asset(riveAnimation),
            ),
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Center(
              child: LoadingAnimationWidget.horizontalRotatingDots(
                color: context.theme.current.splashItem,
                size: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> load() async {
    // Load something in here
    final Future minWaittingDuration =
        Future.delayed(const Duration(seconds: 3));
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await minWaittingDuration;
    // Direct to somewhere
    if (mounted) {
      context.router.replace(const HomeRoute());
    }
  }
}
