import 'package:flutter/material.dart';

import 'src/navbar.dart';
import 'src/navitem.dart';

class AppNavBar extends StatelessWidget {
  final int? current;

  const AppNavBar({super.key, this.current});

  @override
  Widget build(BuildContext context) {
    return NavBar(
      children: [
        NavItem(
          icon: Icons.home,
          active: current == 0,
          passiveTap: () {},
        ),
        NavItem(
          icon: Icons.search,
          active: current == 1,
          passiveTap: () {},
        ),
        NavItem(
          icon: Icons.add_box_rounded,
          active: current == 2,
          passiveTap: () {},
        ),
        NavItem(
          icon: Icons.inbox_rounded,
          active: current == 3,
          passiveTap: () {},
        ),
        NavItem(
          icon: Icons.person,
          active: current == 4,
          passiveTap: () {},
        ),
      ],
    );
  }
}
