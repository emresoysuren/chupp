import 'package:chupp/config/styles.dart';
import 'package:chupp/config/texts.dart';
import 'package:chupp/utils/theme/repo/theme.dart';
import 'package:chupp/widgets/bar.dart';
import 'package:chupp/widgets/disable_scroll_behavior.dart';
import 'package:chupp/widgets/navbar/app_navbar.dart';
import 'package:chupp/widgets/posts/mini_post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.current.primaryBg,
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
          itemCount: 5,
          itemBuilder: (context, index) => const MiniPost(),
        ),
      ),
      bottomNavigationBar: const AppNavBar(current: 0),
    );
  }
}
