import 'package:auto_route/auto_route.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/guards/auth_state_notifier.dart';
import 'package:chupp/utils/theme/config/app_theme_mode.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Duration get _minWaittingDuration => const Duration(seconds: 3);

  String get riveAnimation {
    if (context.theme.mode == AppThemeMode.light) {
      return "assets/rive/chupp-title/white.riv";
    } else if (context.theme.mode == AppThemeMode.dark) {
      return "assets/rive/chupp-title/blue.riv";
    }
    return "assets/rive/chupp-title/white.riv";
  }

  @override
  void didChangeDependencies() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: context.theme.current.splashBg,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    context.theme.resetNavColor();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.splashBg,
      resizeToAvoidBottomInset: false,
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
    final Future waitMin = Future.delayed(_minWaittingDuration);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    AuthStateNotifier.instance.init();
    await waitMin;
    // Direct to somewhere
    if (mounted) {
      context.router.replace(const HomeRoute());
    }
  }
}
