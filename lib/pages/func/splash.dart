import 'package:auto_route/auto_route.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/utils/context_extension.dart';
import 'package:chupp/firebase_options.dart';
import 'package:chupp/widgets/title_loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.current.primaryBg,
      body: Center(
        child: TitleLoading(
          title: Texts.title,
          style: context.styles.appTitle,
        ),
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
