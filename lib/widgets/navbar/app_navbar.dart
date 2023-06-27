import 'package:auto_route/auto_route.dart';
import 'package:chupp/pages/main/create_post.dart';
import 'package:chupp/routes/basic.dart';
import 'package:chupp/utils/router/app_router.gr.dart';
import 'package:chupp/utils/router/extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'src/navbar.dart';
import 'src/navitem.dart';

class AppNavBar extends StatelessWidget {
  final int? current;
  final Function()? activeTap;

  const AppNavBar({super.key, this.current, this.activeTap});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = context.router;
    return Hero(
      tag: "app-nav-bar",
      child: NavBar(
        children: [
          NavItem(
            icon: const FaIcon(FontAwesomeIcons.house).icon,
            size: 22,
            active: current == 0,
            passiveTap: () => router.openBase(const HomeRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass).icon,
            size: 24,
            active: current == 1,
            passiveTap: () => router.open(const SearchRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: const FaIcon(FontAwesomeIcons.solidSquarePlus).icon,
            size: 26,
            passiveTap: () => Navigator.push(
              context,
              BasicPageRoute(
                start: Start.bottom,
                child: const CreatePostPage(),
              ),
            ),
            activeTap: activeTap,
          ),
          NavItem(
            icon: const FaIcon(FontAwesomeIcons.solidHeart).icon,
            size: 26,
            active: current == 2,
            passiveTap: () => router.open(const LikedPostsRoute()),
            activeTap: activeTap,
          ),
          NavItem(
            icon: const FaIcon(FontAwesomeIcons.solidCircleUser).icon,
            size: 26,
            active: current == 3,
            passiveTap: () => router.open(const ProfileRoute()),
            activeTap: activeTap,
          ),
        ],
      ),
    );
  }
}
