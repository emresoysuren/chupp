import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/config/utils.dart';
import 'package:chupp/widgets/bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/mini_post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.theme.current.primaryBg,
      appBar: Bar(
        center: true,
        children: [
          Text(
            Texts.title,
            style: Styles.appTitle,
          )
        ],
      ),
      body: DisableScrollBehavior(
        child: ListView.builder(
          controller: _controller,
          itemCount: 5,
          itemBuilder: (context, index) => const MiniPost(),
        ),
      ),
      bottomNavigationBar: AppNavBar(
        current: 0,
        activeTap: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.ease,
        ),
      ),
    );
  }
}
