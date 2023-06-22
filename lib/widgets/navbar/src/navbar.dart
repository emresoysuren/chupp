import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

import 'navitem.dart';

class NavBar extends StatelessWidget {
  final List<NavItem>? children;

  const NavBar({super.key, this.children});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.current.primaryBg,
      child: SizedBox(
        height: 64,
        width: double.infinity,
        child: Row(
          children: children ?? [],
        ),
      ),
    );
  }
}
