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
    return NavBar(
      children: [
        NavItem(
          icon: const FaIcon(FontAwesomeIcons.house).icon,
          size: 22,
          active: current == 0,
          passiveTap: () {},
          activeTap: activeTap,
        ),
        NavItem(
          icon: const FaIcon(FontAwesomeIcons.magnifyingGlass).icon,
          size: 24,
          active: current == 1,
          passiveTap: () {},
          activeTap: activeTap,
        ),
        NavItem(
          icon: const FaIcon(FontAwesomeIcons.solidSquarePlus).icon,
          size: 26,
          active: current == 2,
          passiveTap: () {},
          activeTap: activeTap,
        ),
        NavItem(
          icon: const FaIcon(FontAwesomeIcons.inbox).icon,
          size: 26,
          active: current == 3,
          passiveTap: () {},
          activeTap: activeTap,
        ),
        NavItem(
          icon: const FaIcon(FontAwesomeIcons.solidCircleUser).icon,
          size: 26,
          active: current == 4,
          passiveTap: () {},
          activeTap: activeTap,
        ),
      ],
    );
  }
}
