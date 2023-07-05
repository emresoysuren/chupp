import 'package:chupp/utils/utils/context_extension.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final Widget? child;
  final IconData? icon;
  final bool? active;
  final Function()? activeTap;
  final Function()? passiveTap;
  final Function()? activeLPress;
  final Function()? passiveLPress;
  final double? size;

  const NavItem({
    super.key,
    this.child,
    this.icon,
    this.active,
    this.activeTap,
    this.passiveTap,
    this.activeLPress,
    this.passiveLPress,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: active == true ? activeTap : passiveTap,
        onLongPress: active == true
            ? activeLPress ?? activeTap
            : passiveLPress ?? passiveTap,
        child: Center(
          child: child ??
              Icon(
                icon,
                color: active != true
                    ? context.theme.current.secondaryItem
                    : context.theme.current.primaryItem,
                size: size,
              ),
        ),
      ),
    );
  }
}
